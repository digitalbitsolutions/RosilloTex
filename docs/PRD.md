# Product Requirements Document (PRD)

## Project

- Product: Rosillo Tex Corporate Website
- Version: v0.1 (Draft)
- Date: 2026-02-21
- Owner: Rosillo Tex
- Product Type: B2B lead generation website

## 1. Executive Summary

Rosillo Tex needs a corporate website to sell custom apparel services to organizations in Miami,
Florida. The core offer is custom garment production through embroidery and screen printing for
businesses, schools, corporate events, and reunions.

The MVP must launch with English content, clear service pages, and a lead-focused contact flow.
WordPress will manage content, and Astro will deliver a fast frontend.

## 2. Product Vision

Build the best local website in Miami for organizations that need reliable custom uniforms and
promotional apparel production.

## 3. Business Goals

- Increase qualified inbound leads from Miami-area organizations.
- Present Rosillo Tex as a trusted partner for custom uniforms and branded apparel.
- Create a scalable content system for SEO and long-term growth.
- Prepare the platform for future ecommerce expansion.

## 4. Non-Goals (MVP)

- Online checkout and payment processing.
- Full CRM automation rollout.
- Multi-language launch.
- Marketplace functionality.

## 5. Target Market and ICP

Primary market:

- Miami, Florida (initial launch geography).

Primary customer profiles:

- Small and medium businesses needing employee uniforms.
- Schools and education groups running promotions and spirit wear campaigns.
- Corporate teams running internal and public events.
- Reunion organizers needing bulk custom apparel.

Buyer roles:

- Business owners
- Operations managers
- HR/Admin buyers
- School coordinators
- Event organizers

## 6. Core Value Proposition

Rosillo Tex helps organizations produce high-quality custom apparel with predictable delivery,
clear communication, and repeatable quality in embroidery and screen printing.

## 7. MVP Scope (In)

- Corporate pages:
  - Home
  - Services
  - Industries
  - Contact
- Blog listing and article detail from WordPress headless.
- SEO baseline:
  - metadata
  - canonical tags
  - Open Graph
- Lead baseline:
  - contact form UI
  - click-to-contact actions (phone/email/WhatsApp in next iteration)
- Initial service positioning:
  - school promotions
  - school uniforms
  - corporate uniforms
  - corporate event apparel
  - reunion apparel
  - embroidery services
  - screen printing services

## 8. Out of Scope (MVP)

- Checkout/cart
- Product catalog ecommerce
- Customer account area
- Dynamic pricing engine
- Advanced personalization engine

## 9. Key User Flows

Flow A: New visitor to qualified lead

1. User lands on Home from search or referral.
2. User reviews services and industries.
3. User opens Contact page and submits inquiry.
4. Sales team receives lead and starts quote process.

Flow B: SEO visitor to service inquiry

1. User lands on a service-focused page (Miami intent).
2. User reviews proof and offering details.
3. User clicks contact CTA.
4. User submits request with order scope.

Flow C: Content visitor to inquiry

1. User reads blog post from Google.
2. User navigates to relevant service page.
3. User submits contact form.

## 10. Functional Requirements

P0 requirements:

- Site must be published in English at launch.
- Site must target Miami, Florida intent in key pages.
- Pages: Home, Services, Industries, Contact, Blog listing, Blog detail.
- WordPress REST API integration for posts.
- Graceful error state when CMS is unavailable.
- Contact page must include lead form fields:
  - company
  - work email
  - order size
  - notes

P1 requirements:

- Add case studies/testimonials content blocks.
- Add gallery section for completed work (owner-provided photos).
- Add WhatsApp click tracking.
- Add more Miami-specific landing page variants.

## 11. Content Requirements

- Launch language: English only.
- Tone: professional, direct, B2B friendly.
- Messaging priority:
  - reliability
  - quality
  - turnaround
  - repeat-order support
- Service keywords to cover:
  - custom uniforms miami
  - embroidery services miami
  - screen printing miami
  - school spirit shirts miami
  - corporate event shirts miami
  - reunion shirts miami
- Content assets needed:
  - real project photos from owner
  - short service descriptions
  - process overview
  - CTA copy for quote requests

## 12. UX and Design Requirements

- Mobile-first responsive layout.
- Clear primary CTA above the fold.
- Visible trust signals (quality/process/proof).
- Fast-scannable sections for buyers with low attention time.
- Service cards aligned to core demand categories.

## 13. Technical Requirements

- Frontend: Astro + TypeScript + Tailwind.
- CMS: WordPress headless via REST API.
- Environment: local Docker for WordPress, Astro local dev.
- Performance targets:
  - Lighthouse mobile >= 90 (Perf/SEO/Best Practices target)
  - LCP < 2.5s
  - CLS < 0.1
- Reliability:
  - CMS fetch timeout and fallback states.

## 14. Analytics and Measurement

Primary conversion events:

- Contact form submit
- Click to call
- Click to WhatsApp
- Email click

Core KPIs:

- Monthly qualified leads
- Service page to contact conversion rate
- Organic sessions from Miami queries
- Blog-to-lead conversion rate

## 15. MVP Acceptance Criteria

- English copy is present on all launch pages.
- Miami, Florida positioning is explicit in metadata and core messaging.
- Blog listing consumes WordPress posts via REST API.
- Blog detail route renders published post content.
- CMS failure shows a friendly fallback state.
- Contact page is visible and usable.
- Build passes without errors.

## 16. Rollout Plan (Initial)

Phase A: Foundation

- finalize PRD and IA
- finalize baseline copy in English
- confirm service taxonomy

Phase B: MVP launch

- launch Home/Services/Industries/Contact/Blog
- enable analytics events
- publish initial blog content

Phase C: Optimization

- add gallery and proof blocks
- launch local SEO landing variants
- improve conversion flow and tracking

## 17. Risks and Mitigation

- Risk: weak local SEO relevance.
  - Mitigation: Miami-first keyword map and localized page copy.
- Risk: low trust without portfolio proof.
  - Mitigation: prioritize real photo gallery and specific use cases.
- Risk: CMS downtime impacts blog generation.
  - Mitigation: fallback UI and monitoring.

## 18. Dependencies

- WordPress setup completed.
- Initial service copy approved.
- Owner-provided photo assets organized.
- Tracking IDs and analytics setup provided.

## 19. Open Questions

- Which vertical should be the primary homepage CTA first:
  - school promotions or corporate uniforms?
- What is the target turnaround promise by service type?
- Should we prioritize a dedicated Miami landing page in MVP or right after launch?
- Which CRM will receive lead submissions in Phase 2?

## 20. Change Log

- 2026-02-21: v0.1 draft created from current repo context and business direction.
