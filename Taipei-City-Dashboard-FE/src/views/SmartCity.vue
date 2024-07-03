<template>
  <div class="conversation-page">
    <div class="messages">
      <div
        v-for="(message, index) in messages"
        :key="index"
        class="message"
      >
        {{ message }}
      </div>
    </div>
    <input
      v-model="newMessage"
      placeholder="Type a message..."
    >
    <button @click="sendMessage">
      Send
    </button>
  </div>
</template>

<script>
export default {
	name: 'ConversationPage',
	data() {
		return {
			messages: [],
			newMessage: ''
		};
	},
	methods: {
		sendMessage() {
			if (this.newMessage.trim() !== '') {
				this.messages.push(this.newMessage);
				this.newMessage = '';
			}
		}
	}
};
</script>

<style>
.conversation-page {
	display: flex;
	flex-direction: column;
	align-items: center;
	padding: 20px;
}

.messages {
	margin-bottom: 20px;
	width: 100%;
	max-height: 300px;
	overflow-y: auto;
}

.message {
	background-color: #f0f0f0;
	margin: 5px 0;
	padding: 10px;
	border-radius: 5px;
}

input {
	margin-right: 10px;
	padding: 10px;
	width: calc(100% - 120px);
}

button {
	padding: 10px 20px;
}
</style>