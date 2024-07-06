<template>
	<div class="chat-container">
		<h1>OpenAI API Vue 示例</h1>
		<div class="messages">
			<div v-for="(message, index) in chatHistory" :key="index" :class="['message', message.role]">
				{{ message.content }}
			</div>
		</div>
		<div class="input-area">
			<textarea v-model="prompt" placeholder="在這裡輸入你的問題..." @keyup.enter.ctrl="generateResponse"></textarea>
			<button @click="generateResponse" :disabled="isLoading">
				{{ isLoading ? '生成中...' : '發送' }}
			</button>
		</div>
	</div>
</template>

<script>

import { ref } from 'vue'

export default {
	name: 'OpenAIChat',
	setup() {
		const prompt = ref('')
		const chatHistory = ref([])
		const isLoading = ref(false)

		const generateResponse = async () => {
			if (!prompt.value.trim()) return

			isLoading.value = true
			chatHistory.value.push({ role: 'user', content: prompt.value })

			try {
				const response = await fetch('/generate', {
					method: 'POST',
					headers: { 'Content-Type': 'application/json' },
					body: JSON.stringify({
						prompt: this.prompt,
						session_id: 'user123'  // 使用唯一的會話 ID
					})
				})

				const data = await response.json()

				if (!apiResponse.ok) {
					throw new Error(`API 錯誤: ${data.error || apiResponse.statusText}`)
				}

				chatHistory.value.push({ role: 'assistant', content: data.response })
				this.prompt = '' // 清空輸入框
			} catch (error) {
				console.error('Error:', error)
				chatHistory.value.push({ role: 'assistant', content: '抱歉，發生錯誤。請稍後再試。' })
			} finally {
				isLoading.value = false
				prompt.value = ''
			}
		}

		return {
			prompt,
			chatHistory,
			isLoading,
			generateResponse
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
	height: 400px;
	overflow-y: auto;
	border: 1px solid #e1e4e8;
	border-radius: 4px;
	padding: 10px;
	margin-bottom: 20px;
}

.message {
	margin-bottom: 10px;
	padding: 8px 12px;
	border-radius: 18px;
	max-width: 80%;
}

.user {
	background-color: #007bff;
	color: white;
	align-self: flex-end;
	margin-left: auto;
}

.assistant {
	background-color: #f1f3f5;
	color: #333;
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