<template>
	<div class="chat" ref="currentMessage">
		<div class="profile">
			<img v-if="chat.isAi" src="../assets/images/bot.svg" alt="" />
			<img v-else src="../assets/images/user.svg" alt="" />
		</div>
		<div class="message">
			{{ chat.value }}
		</div>
	</div>
</template>

<script setup>
import { nextTick, onMounted, ref, watch } from "vue";
defineProps({
	chat: {
		type: Object || null,
	},
});
const currentMessage = ref(null);
onMounted(async () => {
	await nextTick();
	const div = currentMessage.value;
	div.scrollIntoView({ behavior: "smooth" });
});
</script>

<style lang="scss" scoped></style>