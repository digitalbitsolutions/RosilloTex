# Blueprint Técnico: Rosillo Tex

## 1. Contexto

Rosillo Tex necesita una plataforma web B2B enfocada en:

- Captación de empresas en Estados Unidos.
- Presentación clara de servicios textiles corporativos.
- Publicación de contenido de autoridad (blog).
- Escalabilidad hacia marketplace B2B/B2B2C con WooCommerce.

## 2. Principios de arquitectura

- Performance first: páginas estáticas por defecto.
- SEO first: contenido estructurado, schema y contenido indexable.
- API contract first: desacople frontend/cms.
- Evolución incremental: no sobrediseñar ecommerce en fase 1.
- Seguridad operativa: WordPress aislado, endurecido y con backups.

## 3. Arquitectura objetivo

## 3.1 Frontend (Astro)

- Astro 6 + TypeScript.
- Render estático para páginas de marketing y blog.
- Híbrido/server solo donde exista necesidad real (carrito, cuenta, checkout en fase futura).
- Styling con Tailwind + design tokens.
- Integraciones:
  - Sitemap y robots.
  - Open Graph y Twitter Cards.
  - JSON-LD para Organization, Service y Article.

## 3.2 CMS (WordPress headless)

- Instalación dedicada en subdominio: `cms.rosillotex.com`.
- Plugins base:
  - Advanced Custom Fields (ACF).
  - Custom Post Type UI (si no se usa código propio para CPT).
  - Yoast SEO o Rank Math (solo para metadatos administrables).
  - WPGraphQL opcional en fase 2.
- Uso inicial de REST API:
  - `/wp-json/wp/v2/posts`
  - `/wp-json/wp/v2/categories`
  - CPT personalizados con soporte REST.

## 3.3 Ecommerce (fase futura)

- WooCommerce en WordPress.
- Frontend consume:
  - Store API (experiencia de compra).
  - WooCommerce REST API (operación/admin/backoffice).
- Arquitectura de transición:
  - Fase 1: sin checkout.
  - Fase 2: catálogo y detalles.
  - Fase 3: carrito + checkout + pagos.

## 4. Modelo de contenido (MVP)

- `Page`:
  - Inicio
  - Servicios
  - Industrias
  - Sobre nosotros
  - Contacto
- `Post` (blog)
- `Case Study` (CPT)
- `Service` (CPT)
- `FAQ` (CPT opcional)

Campos sugeridos con ACF:

- Hero title, hero subtitle, CTA principal.
- Beneficios por servicio.
- Sectores atendidos.
- Galería de trabajos.
- Testimonios.
- Datos de contacto comercial.

## 5. SEO y captación B2B

- Keyword clusters por servicio y sector.
- Páginas transaccionales:
  - uniformes corporativos personalizados
  - bordado de uniformes para empresas
  - estampado textil para compañías
- Estrategia local + nacional:
  - landing Miami
  - landings por estado/industria (si aplica)
- Implementar eventos de conversión:
  - envío de formulario
  - clic en teléfono
  - clic en WhatsApp
  - descarga de catálogo PDF

## 6. Performance y calidad

Objetivos de referencia:

- Lighthouse mobile >= 90 en Performance/SEO/Best Practices.
- LCP < 2.5s.
- CLS < 0.1.
- TTFB competitivo con caché en edge.

Prácticas:

- Imágenes WebP/AVIF y tamaños responsivos.
- Carga diferida de componentes pesados.
- Minificación y splitting por defecto.
- Revalidación/caché según tipo de contenido.

## 7. Seguridad y operación

- WordPress detrás de Cloudflare.
- Limitar XML-RPC y endpoints no usados.
- MFA para administradores.
- Backups diarios + retención.
- Entornos: `dev`, `staging`, `production`.

## 8. Analítica y CRM

- GA4 + Google Tag Manager.
- Search Console.
- Pixel/Ads según estrategia comercial.
- Integración de formularios con CRM (HubSpot, Zoho o similar).

## 9. Riesgos y mitigación

- Riesgo: WordPress lento por plugins excesivos.
  - Mitigación: baseline de plugins y auditoría trimestral.
- Riesgo: deuda SEO por contenido sin estrategia.
  - Mitigación: calendar editorial + brief por keyword intent.
- Riesgo: transición ecommerce compleja.
  - Mitigación: contractos API y fases claras de evolución.

## 10. Entorno local recomendado

- Frontend Astro en `localhost:4321` (host machine).
- WordPress headless en Docker Desktop (`localhost:18080`).
- MySQL en Docker (`localhost:3307`).
- Herramientas locales:
  - phpMyAdmin (`localhost:18081`)
  - Mailpit (`localhost:8025`)

Con este esquema, el backend se mantiene aislado y reproducible, sin bloquear el flujo de desarrollo del frontend.
