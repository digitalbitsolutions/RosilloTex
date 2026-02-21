const DEFAULT_API_BASE = "http://localhost:18080/wp-json/wp/v2";
const REQUEST_TIMEOUT_MS = 8000;

export interface WpRenderedField {
	rendered: string;
}

export interface WpPost {
	id: number;
	date: string;
	slug: string;
	link: string;
	title: WpRenderedField;
	excerpt: WpRenderedField;
	content: WpRenderedField;
}

export class WpApiError extends Error {
	constructor(message: string) {
		super(message);
		this.name = "WpApiError";
	}
}

function getApiBase(): string {
	return (import.meta.env.PUBLIC_CMS_API_BASE ?? DEFAULT_API_BASE).replace(/\/$/, "");
}

function buildEndpoint(path: string, params: Record<string, string | number | undefined> = {}): string {
	const apiBase = getApiBase();
	if (!apiBase) {
		throw new WpApiError("PUBLIC_CMS_API_BASE is not configured.");
	}

	const url = new URL(`${apiBase}${path}`);
	Object.entries(params).forEach(([key, value]) => {
		if (value === undefined) {
			return;
		}
		url.searchParams.set(key, String(value));
	});
	return url.toString();
}

async function fetchWp<T>(
	path: string,
	params?: Record<string, string | number | undefined>
): Promise<T> {
	const endpoint = buildEndpoint(path, params);
	const controller = new AbortController();
	const timer = setTimeout(() => controller.abort(), REQUEST_TIMEOUT_MS);

	try {
		const response = await fetch(endpoint, {
			headers: {
				Accept: "application/json"
			},
			signal: controller.signal
		});

		if (!response.ok) {
			throw new WpApiError(`CMS request failed with status ${response.status}.`);
		}

		const contentType = response.headers.get("content-type") ?? "";
		if (!contentType.includes("application/json")) {
			throw new WpApiError(
				"CMS returned non-JSON data. Complete WordPress setup or verify PUBLIC_CMS_API_BASE."
			);
		}

		return (await response.json()) as T;
	} catch (error) {
		if (error instanceof WpApiError) {
			throw error;
		}
		if (error instanceof Error && error.name === "AbortError") {
			throw new WpApiError("CMS request timed out.");
		}
		throw new WpApiError("Unexpected error while requesting CMS content.");
	} finally {
		clearTimeout(timer);
	}
}

export async function getRecentPosts(limit = 12): Promise<WpPost[]> {
	const perPage = Math.min(Math.max(limit, 1), 50);
	return fetchWp<WpPost[]>("/posts", {
		per_page: perPage,
		orderby: "date",
		order: "desc",
		status: "publish"
	});
}

export async function getPostBySlug(slug: string): Promise<WpPost | null> {
	const posts = await fetchWp<WpPost[]>("/posts", {
		slug,
		per_page: 1,
		status: "publish"
	});
	return posts[0] ?? null;
}

const htmlEntityMap: Record<string, string> = {
	"&amp;": "&",
	"&lt;": "<",
	"&gt;": ">",
	"&quot;": '"',
	"&#39;": "'",
	"&nbsp;": " "
};

export function toPlainText(value: string): string {
	const withoutTags = value.replace(/<[^>]+>/g, " ");
	return withoutTags
		.replace(/&(amp|lt|gt|quot|#39|nbsp);/g, (entity) => htmlEntityMap[entity] ?? entity)
		.replace(/\s+/g, " ")
		.trim();
}
