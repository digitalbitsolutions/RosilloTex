# Design System and Tokens

## 1. Purpose

This document defines the baseline design system for the Rosillo Tex frontend (`apps/web`) and
acts as a single reference for visual consistency, accessibility, and scalability.

Scope:

- Global style tokens.
- Reusable global classes.
- Accessibility requirements (WCAG 2.2).
- Token usage rules for implementation.

Source of truth:

- `apps/web/src/styles/global.css`
- `apps/web/src/layouts/Layout.astro` (font loading and global shell)

## 2. Design Principles

- Corporate and trustworthy visual language.
- Miami-focused B2B positioning.
- High readability and contrast first.
- Mobile-first layout behavior.
- Reuse over one-off styling.

## 3. Color Tokens

| Token | Value | Intended Usage |
| --- | --- | --- |
| `--ink-900` | `#0f2744` | Primary text, strong headings, high-emphasis elements |
| `--ink-700` | `#24456b` | Secondary text, body copy |
| `--ink-500` | `#4a678a` | Eyebrows, muted metadata |
| `--brand-700` | `#004d96` | Primary hover/pressed states, inline link emphasis |
| `--brand-600` | `#0059ad` | Primary action buttons |
| `--brand-500` | `#0066c5` | Accent support |
| `--surface-soft` | `#f3f6fa` | App/page background |
| `--surface-muted` | `#e9eef5` | Neutral alternate sections |
| `--surface-white` | `#ffffff` | Cards and content surfaces |
| `--line` | `#c7d4e2` | Borders and separators |
| `--footer-bg` | `#112f52` | Footer and dark CTA surfaces |
| `--footer-line` | `#2f4f73` | Borders on dark surfaces |
| `--on-dark` | `#f7fbff` | Text on dark backgrounds |

## 4. Typography Tokens

| Role | Value | Usage |
| --- | --- | --- |
| Heading family | `"Fraunces", Georgia, serif` | Main titles and display headings |
| Body family | `"IBM Plex Sans", "Segoe UI", sans-serif` | Paragraphs, labels, buttons |
| Eyebrow style | `0.7rem`, uppercase, `0.18em` tracking | Section labels |
| Page title style | `clamp(2rem, 4vw, 3.3rem)` | Top-level page heading |
| Body/subtitle style | ~`1rem` + relaxed line-height | Longer descriptive text |

## 5. Structural Tokens and Global Patterns

| Pattern | Definition |
| --- | --- |
| Base radius | `0.8rem - 0.85rem` on cards/sections |
| Base shadow | `rgba(15, 39, 68, 0.07 - 0.08)` soft depth |
| Border style | `1px solid var(--line)` |
| Focus ring | `3px` visible outline (`#5db4ff` / `#c8e2ff`) |

## 6. Global Utility Classes

### Layout and Sections

- `section-shell`: standard bordered surface container.
- `section-muted`: alternate neutral section background.
- `section-inverse`: dark section for CTA/footer blocks.
- `surface-panel`: full-width content panel with separators.
- `page-hero`: standard top section padding.

### Typography

- `eyebrow`: uppercase section marker.
- `page-title`: global page heading style.
- `page-subtitle`: global intro paragraph style.

### Cards and Grids

- `content-card`: generic card style.
- `content-card-list`: list spacing for card lists.
- `grid-cards-2`: responsive two-column card grid.
- `grid-cards-3`: responsive three-column card grid.
- `blog-card`: blog listing card style.
- `blog-meta`: date/meta label style.

### Actions and Links

- `btn-primary`: main CTA button.
- `btn-secondary`: secondary CTA button.
- `link-inline`: emphasized inline link.

### Forms

- `form-shell`: form layout spacing.
- `field-label`: standardized form label style.
- `field-control`: standardized input/select/textarea style.

### Navigation and Header

- `nav-link`: default nav item style.
- `nav-link-active`: active nav state.
- `skip-link`: keyboard accessibility quick jump.

## 7. Accessibility Standards (WCAG 2.2)

Minimum requirements:

- Normal text: AA >= 4.5:1.
- Large text: AA >= 3:1.
- UI components and focus indicators must be clearly visible.

Validated key contrast pairs in current system:

| Pair | Ratio | Compliance |
| --- | --- | --- |
| `--ink-900` on `--surface-soft` | `13.90:1` | AAA |
| `--ink-700` on `--surface-white` | `9.82:1` | AAA |
| `#ffffff` on `--brand-600` | `6.93:1` | AA (normal text) |
| `--on-dark` on `--footer-bg` | `13.01:1` | AAA |
| `--ink-900` on white | `15.06:1` | AAA |

## 8. Implementation Rules

Do:

- Use tokenized colors (`var(--...)`) in global styles.
- Reuse global classes before introducing new ones.
- Keep typography and spacing consistent with existing patterns.
- Validate contrast whenever introducing new color combinations.

Do not:

- Hardcode random hex colors in page files.
- Add one-off inline styling when a global class can solve it.
- Create duplicated button/card variants without a shared token.

## 9. Reference Usage Snippet

```astro
<section class="section-shell page-hero">
  <p class="eyebrow">Services</p>
  <h1 class="page-title mt-2">Custom apparel services for Miami organizations.</h1>
  <p class="page-subtitle">Embroidery and screen printing for uniforms and events.</p>
  <a href="/contacto" class="btn-primary mt-6">Get a Quote</a>
</section>
```

## 10. Governance

When updating tokens:

1. Update `apps/web/src/styles/global.css`.
2. Update this document (`docs/DESIGN-SYSTEM.md`).
3. Revalidate contrast for changed color pairs.
4. Run `npm run build` in `apps/web`.

Version history:

- `2026-02-21`: v0.1 initial documented token system.
