import os
from dotenv import load_dotenv
from flask import Flask, jsonify, request, send_from_directory
from flask_cors import CORS
from langchain_openai import ChatOpenAI
from langchain_core.output_parsers import StrOutputParser
from langchain_core.chat_history import BaseChatMessageHistory
from langchain_core.runnables.history import RunnableWithMessageHistory
from langchain_community.chat_message_histories import ChatMessageHistory
from langchain_community.utilities import SQLDatabase
from langchain.chains import create_sql_query_chain
from langchain_community.tools.sql_database.tool import QuerySQLDataBaseTool
from operator import itemgetter
from langchain_core.prompts import ChatPromptTemplate
from langchain_core.runnables import RunnablePassthrough

# Environment setup
def load_environment():
    load_dotenv()
    os.environ["LANGCHAIN_TRACING_V2"] = "true"
    os.environ["LANGCHAIN_API_KEY"] = get_env_or_default("LANGCHAIN_API_KEY", "")
    os.environ["OPENAI_API_KEY"] = get_env_or_default("OPENAI_API_KEY", "")
    os.environ["TAVILY_API_KEY"] = get_env_or_default("TAVILY_API_KEY", "")

def get_env_or_default(key, default):
    value = os.getenv(key)
    if value is None or value.strip() == '':
        print(f"Warning: Environment variable {key} is not set. Using default value: {default}")
        return default
    return value

# Database setup
def get_db():
    db_uri = "postgresql+psycopg2://{user}:{password}@{host}:{port}/{dbname}".format(
        user=get_env_or_default('DB_DASHBOARD_USER', 'postgres'),
        password=get_env_or_default('DB_DASHBOARD_PASSWORD', 'Abb00717717abb'),
        host=get_env_or_default('DB_DASHBOARD_HOST', 'postgres-data'),
        port=get_env_or_default('DB_DASHBOARD_PORT', '5432'),
        dbname=get_env_or_default('DB_DASHBOARD_DBNAME', 'dashboard')
    )
    return SQLDatabase.from_uri(db_uri)

# Flask app setup
def create_app():
    app = Flask(__name__, static_folder=".")
    CORS(app)
    return app

# AI model and tools setup
def setup_ai_model():
    model = ChatOpenAI(model="gpt-3.5-turbo")
    db = get_db()
    execute_query = QuerySQLDataBaseTool(db=db)
    write_query = create_sql_query_chain(model, db)
    
    answer_prompt = ChatPromptTemplate.from_messages([
        ("system", "You are an AI assistant that answers questions based on the chat history and SQL query results. Always consider the chat history when formulating your responses."),
        ("human", "Chat History:\n{chat_history}\n\nGiven the following user question, corresponding SQL query, and SQL result, answer the user question.\n\nQuestion: {question}\nSQL Query: {query}\nSQL Result: {result}\nAnswer:"),
    ])

    main_chain = (
        RunnablePassthrough.assign(query=write_query)
        .assign(result=itemgetter("query") | execute_query)
        .assign(chat_history=lambda x: format_chat_history(x["history"]))
        | answer_prompt
        | model
        | StrOutputParser()
    )

    return main_chain

# Chat history management
memory = {}

def getSessionHistory(session_id: str) -> BaseChatMessageHistory:
    if session_id not in memory:
        memory[session_id] = ChatMessageHistory()
    return memory[session_id]

def format_chat_history(chat_history):
    formatted_history = []
    for message in chat_history:
        if message.type == "human":
            formatted_history.append(f"Human: {message.content}")
        elif message.type == "ai":
            formatted_history.append(f"AI: {message.content}")
    return "\n".join(formatted_history)

# Route handlers
def index():
    return send_from_directory(".", "index.html")

def serve_js():
    return send_from_directory(".", "app.js")

def generate_response():
    data = request.json
    prompt = data.get("prompt")
    session_id = data.get("session_id", "default")

    try:
        sql_response = chain_with_history.invoke(
            {"question": prompt},
            config={"configurable": {"session_id": session_id}}
        )
        
        promising_response = chain_check.invoke({
            "question": prompt,
            "sql_response": sql_response
        })
        
        return jsonify({"response": promising_response})
        """
        
        return jsonify({"response": sql_response})
        """
    except Exception as e:
        return jsonify({"error": str(e)}), 500

prompt_check = ChatPromptTemplate.from_messages([
    ("system", "If the response appears to have successfully retrieved data from the SQL database, \
    incorporate the key points of that data into your consideration, and please, you have to make \
    sure all the data is completely the same, or the world would collapse. Also, except give back the data, you have to answer the user's \
    question based on the SQL data; otherwise, if the sql_response \
    reply with some grammar error, directly answer the question without doing so, but you may copy the data that it gives you."),
    ("human", "SQL Response:\n{sql_response}\n\nUser Question: {question}\nAnswer:")
])

# Main application setup
load_environment()
app = create_app()
main_chain = setup_ai_model()
chain_with_history = RunnableWithMessageHistory(
    main_chain,
    getSessionHistory,
    input_messages_key="question",
    history_messages_key="history",
)
chain_check = prompt_check | ChatOpenAI(model="gpt-4o") | StrOutputParser()

# Route definitions
app.route("/")(index)
app.route("/app.js")(serve_js)
app.route("/generate", methods=["POST"])(generate_response)

if __name__ == "__main__":
    app.run(host='0.0.0.0', debug=True)