# Rosillo Tex Frontend (`apps/web`)

Astro frontend for the Rosillo Tex B2B platform. This app consumes WordPress headless content through
the REST API and provides the Sprint 1 baseline pages.

## Current Scope

- Base routes: `/`, `/servicios`, `/industrias`, `/contacto`
- Blog routes: `/blog`, `/blog/[slug]`
- Shared SEO metadata and Open Graph tags in `src/layouts/Layout.astro`
- Tailwind-based styling with global tokens in `src/styles/global.css`
- WordPress fetch utilities in `src/lib/wp.ts`

## Requirements

- Node.js 22+
- npm 10+
- Local WordPress backend running at `http://localhost:18080` (or custom `PUBLIC_CMS_API_BASE`)

## Environment Variables

Create `.env` in `apps/web` based on `.env.example`:

```powershell
Copy-Item .env.example .env
```

Required values:

- `PUBLIC_SITE_URL` (default `http://localhost:4321`)
- `PUBLIC_CMS_API_BASE` (default `http://localhost:18080/wp-json/wp/v2`)

## Development Commands

Run commands from `apps/web`:

```powershell
npm install
npm run dev
```

Build for production validation:

```powershell
npm run build
```

Preview built output:

```powershell
npm run preview
```

## Local Workflow

1. Start backend from repo root: `./scripts/session-start.ps1`
2. In a second terminal: `cd apps/web ; npm run dev`
3. Open `http://localhost:4321`
4. Publish posts in WordPress and validate `/blog`
