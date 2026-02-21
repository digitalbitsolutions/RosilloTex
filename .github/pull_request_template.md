## Summary

Describe what changed and why.

## Scope

- In:
- Out:

## Validation

- [ ] `cd apps/web && npm run build`
- [ ] Manual QA on affected routes
- [ ] Error/empty states checked (if applicable)

## UI Evidence

- [ ] Added before/after screenshots or short video (required for UI changes)

## PR Checklist

Reference: `docs/PR-CHECKLIST.md`

### Product and Scope

- [ ] Aligned with `docs/PRD.md`
- [ ] Aligned with Miami + English-first baseline
- [ ] Scope matches PR title/description

### Design System Compliance

- [ ] Uses tokens/classes from `docs/DESIGN-SYSTEM.md`
- [ ] Avoids one-off styles where global patterns exist
- [ ] Uses token variables for colors (`var(--...)`)

### Accessibility (WCAG 2.2)

- [ ] Contrast meets AA minimum
- [ ] Keyboard navigation verified
- [ ] `focus-visible` remains visible
- [ ] Labels and heading structure validated

### Responsive and UX

- [ ] Mobile/tablet/desktop checked
- [ ] No overflow or clipping issues
- [ ] Primary CTA remains clear

### Content and SEO

- [ ] Copy matches business positioning
- [ ] Metadata/canonical updated where needed
- [ ] Internal links and CTAs reviewed
