const postDateFormatter = new Intl.DateTimeFormat("en-US", {
	month: "short",
	day: "numeric",
	year: "numeric"
});

export function formatPostDate(value: string): string {
	const date = new Date(value);
	if (Number.isNaN(date.getTime())) {
		return value;
	}
	return postDateFormatter.format(date);
}

export function truncate(value: string, length = 160): string {
	if (value.length <= length) {
		return value;
	}
	return `${value.slice(0, length).trimEnd()}...`;
}
