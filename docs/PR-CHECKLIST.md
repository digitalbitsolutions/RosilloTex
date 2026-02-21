# PR Checklist

Use this checklist before merging any pull request.

## 1. Product and Scope

- [ ] Change is aligned with `docs/PRD.md`.
- [ ] Change supports launch market and content baseline (Miami, Florida + English-first where applicable).
- [ ] Scope is limited to what the PR title/description claims.

## 2. Design System Compliance

- [ ] UI uses tokens/classes from `docs/DESIGN-SYSTEM.md`.
- [ ] No one-off visual styles were introduced when a global class/token already exists.
- [ ] Colors use token variables (`var(--...)`) in global CSS.
- [ ] Buttons, cards, forms, and sections follow global patterns.

## 3. Accessibility (WCAG 2.2)

- [ ] Text/background contrast meets AA minimum (4.5:1 normal text, 3:1 large text).
- [ ] Keyboard navigation works for interactive elements.
- [ ] Visible `focus-visible` styles are present and not removed.
- [ ] Interactive controls have accessible labels.
- [ ] Semantic heading order is valid (`h1` -> `h2` -> `h3`).

## 4. Responsive and UX

- [ ] Layout works in mobile, tablet, and desktop breakpoints.
- [ ] No overflow or clipped content in common viewport sizes.
- [ ] Primary CTA is visible and understandable in top sections.

## 5. Content and SEO

- [ ] Copy is consistent with business positioning (custom uniforms, embroidery, screen printing).
- [ ] Page metadata is present (title, description, canonical when needed).
- [ ] Internal links and CTA labels are clear and consistent.

## 6. Code Quality

- [ ] No dead code or unused imports introduced.
- [ ] New classes/components are reusable and named consistently.
- [ ] No secrets or sensitive values added.
- [ ] Docs were updated if behavior or conventions changed.

## 7. Validation

- [ ] `npm run build` passes in `apps/web`.
- [ ] Manual QA performed on affected pages.
- [ ] Error and empty states verified where applicable.

## 8. PR Evidence

- [ ] PR description includes what changed and why.
- [ ] Before/after screenshots (or short video) attached for UI changes.
- [ ] Known limitations or follow-up tasks documented.
