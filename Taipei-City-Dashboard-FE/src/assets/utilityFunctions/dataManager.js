
export class DataManager {
	constructor(data) {
		this.obj = data || {};
		this.mapping = [
			{ name: "token", key: "data" },
			{ name: "isso_token", key: "taipeiPass" },
			{ name: "user", key: "person" },
			{ name: "user_id", key: "identity" },
		];
	}

	getData(key = "data") {
		const mapItem = this.mapping.find(item => item.name === key);
		if (!mapItem) {
			return null;
		}
		
		return this.obj[mapItem.name] || null;
	}
}