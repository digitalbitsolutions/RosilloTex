# JOB SPRINT 1 - Astro Base + WP Headless

## 1. Objective

Implementar la base tecnica del frontend en Astro y conectarlo al WordPress local headless para blog.

## 2. Scope (In)

- Crear app Astro en `apps/web` con TypeScript strict.
- Instalar y configurar Tailwind.
- Crear layout base y paginas:
  - `/`
  - `/servicios`
  - `/industrias`
  - `/contacto`
- Integrar consumo de posts desde `PUBLIC_CMS_API_BASE`.
- Crear rutas:
  - `/blog`
  - `/blog/[slug]`
- Agregar utilidades de fetch con manejo basico de errores/timeouts.
- Agregar SEO base (title, description, OG) por pagina.
- Documentar comandos de desarrollo en `apps/web/README.md`.

## 3. Scope (Out)

- Checkout, carrito o ecommerce.
- Integracion CRM real.
- Estilos finales de marca.
- Tests e2e.

## 4. Acceptance Criteria

- [ ] `npm run build` en `apps/web` funciona sin errores.
- [ ] `/blog` lista posts reales desde WordPress local.
- [ ] `/blog/[slug]` renderiza contenido de un post.
- [ ] En caso de fallo de API, mostrar estado amigable.
- [ ] Variables de entorno necesarias documentadas.

## 5. Required Validation

- Ejecutar:
  - `cd apps/web`
  - `npm run build`
  - `npm run dev`

## 6. Deliverables

- Commits en rama de trabajo.
- Reporte final en `reports/final-report.md`.
- Estado final: `STATUS: SUCCESS` o `STATUS: FAIL`.

## 7. Constraints

- No preguntas interactivas.
- No modificar secretos.
- Mantener cambios dentro de este repositorio.

## 8. Content Localization Constraints (added 2026-02-21)

- Contenido inicial en ingles.
- Copy orientado a mercado local de Miami, Florida.
- Priorizar oferta para school promotions, uniforms, corporate events, reunions, embroidery, and screen printing.
