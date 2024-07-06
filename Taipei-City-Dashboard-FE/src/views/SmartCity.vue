<template>
	<div class="chat-container">
		<h1>智慧城市聊天室</h1>
		<div class="messages" ref="messagesContainer">
			<div v-for="(message, index) in chatHistory" :key="index" :class="['message', message.role]">
				{{ message.content }}
			</div>
		</div>
		<div class="input-area">
			<textarea v-model="prompt" placeholder="在這裡輸入你的問題..." @keyup.enter="generateResponse"></textarea>
			<button @click="generateResponse" :disabled="isLoading">
				{{ isLoading ? '生成中...' : '發送' }}
			</button>
		</div>
	</div>
</template>

<script>
import { ref, onMounted, nextTick } from 'vue'

export default {
	name: 'SmartCity',
	setup() {
		const prompt = ref('')
		const chatHistory = ref([])
		const isLoading = ref(false)
		const messagesContainer = ref(null)

		const scrollToBottom = () => {
			nextTick(() => {
				if (messagesContainer.value) {
					messagesContainer.value.scrollTop = messagesContainer.value.scrollHeight
				}
			})
		}

		const generateResponse = async () => {
			if (!prompt.value.trim()) return

			isLoading.value = true
			chatHistory.value.push({ role: 'user', content: prompt.value })
			scrollToBottom()

			try {
				const response = await fetch('http://localhost:5001/generate', {
					method: 'POST',
					headers: { 'Content-Type': 'application/json' },
					body: JSON.stringify({
						prompt: prompt.value,
						session_id: 'user123'  // 使用唯一的會話 ID
					})
				})

				const data = await response.json()

				if (!response.ok) {
					throw new Error(`API 錯誤: ${data.error || response.statusText}`)
				}

				chatHistory.value.push({ role: 'assistant', content: data.response })
				scrollToBottom()
			} catch (error) {
				console.error('Error:', error)
				chatHistory.value.push({ role: 'assistant', content: '抱歉，發生錯誤。請稍後再試。' })
			} finally {
				isLoading.value = false
				prompt.value = ''
			}
		}

		onMounted(() => {
			scrollToBottom()
		})

		return {
			prompt,
			chatHistory,
			isLoading,
			generateResponse,
			messagesContainer
		}
	}
}
</script>

<style scoped>
.chat-container {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	max-width: 800px;
	margin: 20px auto;
	background: var(--chat-bg-light);
	border-radius: 8px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	padding: 20px;
}

h1 {
	color: #333;
	text-align: center;
	margin-bottom: 20px;
}

.messages {
	height: 500px;
	padding: 10px;
	border: 1px solid #e1e4e8;
	border-radius: 4px;
	margin-bottom: 20px;
	overflow: hidden;
	overflow-y: scroll;
}

.message {
	display: flex;
	width: fit-content;
	max-width: 100%;
	margin-bottom: 10px;
	padding: 8px 12px;
	border-radius: 18px;
	word-wrap: break-word;
}

.user {
	justify-content: flex-end;
	background-color: #007bff;
	color: white;
	margin-left: auto;
	margin-right: 1em;
	max-width: 60%;
	word-wrap: break-word;
}

.assistant {
	justify-content: flex-start;
	background-color: white;
	color: #333;
	margin-right: auto;
	margin-left: 1em;
	max-width: 60%;
	word-wrap: break-word;
}

.input-area {
	display: flex;
	flex-direction: column;
}

textarea {
	width: 100%;
	height: 100px;
	border: 1px solid #ced4da;
	border-radius: 4px;
	padding: 10px;
	margin-bottom: 10px;
	resize: vertical;
}

button {
	background-color: #28a745;
	color: white;
	border: none;
	padding: 10px 20px;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.3s;
	align-self: flex-end;
}

button:hover {
	background-color: #218838;
}

button:active {
	background-color: #145222;
	transform: scale(0.95, 0.95);
	transition-duration: 0.3s;
}

button:disabled {
	background-color: #6c757d;
	cursor: not-allowed;
}
</style>