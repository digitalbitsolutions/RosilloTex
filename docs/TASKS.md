# Backlog Inicial de Tareas

## Bloque Local Dev (nuevo)

- [x] Crear backend dockerizado con Docker Desktop (`docker-compose.yml`).
- [x] Crear variables de entorno Docker (`docker/.env.example`).
- [x] Crear scripts de operacion (`dev-up`, `dev-down`, `dev-logs`, `wp`).
- [x] Documentar setup local en `docs/LOCAL-SETUP.md`.
- [x] Crear scripts de reentrada (`preflight`, `session-start`, `session-stop`).
- [x] Crear guia de reentrada en `docs/START-HERE.md`.
- [ ] Levantar stack local y completar instalacion inicial de WordPress.
- [ ] Instalar plugins base: ACF, CPT UI, SEO plugin.

## Prioridad P0 (arranque obligatorio)

- [ ] Definir dominios finales y proveedor DNS/CDN.
- [ ] Provisionar WordPress en `cms`.
- [ ] Endurecer seguridad base de WordPress (MFA, roles, backups).
- [x] Inicializar proyecto Astro 6 + TypeScript.
- [x] Configurar Tailwind + sistema de tokens.
- [x] Definir layout base y componentes globales (header, footer, CTA).
- [x] Crear integración Astro -> WordPress REST API.
- [x] Crear páginas MVP: Home, Servicios, Industrias, Contacto.
- [x] Implementar listado y detalle de blog desde WordPress.
- [ ] Configurar sitemap, robots, canonical y OG tags.
- [ ] Configurar formulario de contacto con tracking de conversiones.
- [ ] Configurar CI con lint/build en pull requests.

## Prioridad P1 (optimización y crecimiento)

- [ ] Modelar CPT `Case Study` y `Service`.
- [ ] Construir páginas de casos de éxito dinámicas.
- [ ] Integrar Search Console + GA4 + Tag Manager.
- [ ] Diseñar cluster de contenidos SEO por industria.
- [ ] Implementar lead routing hacia CRM.
- [ ] Crear landing local Miami + variantes por industria.
- [ ] Mejorar CWV en mobile con presupuesto de performance.

## Prioridad P2 (pre-ecommerce)

- [ ] Instalar WooCommerce en entorno staging.
- [ ] Definir esquema de productos y variaciones.
- [ ] Exponer endpoints necesarios para catálogo.
- [ ] Crear páginas de catálogo y detalle de producto en Astro.
- [ ] Definir reglas de pricing (B2B tiers si aplica).

## Prioridad P3 (marketplace completo)

- [ ] Implementar carrito con Store API.
- [ ] Implementar checkout y pagos.
- [ ] Configurar impuestos y envíos.
- [ ] Implementar emails transaccionales.
- [ ] Implementar panel interno básico para soporte de pedidos.

## Definición de terminado (DoD)

- Código en rama con PR revisado.
- Build y lint en verde.
- QA funcional validado.
- Métricas y tracking verificados.
- Documentación mínima actualizada.


## Baseline de contenido (actualizado 2026-02-21)

- [x] Definir baseline de idioma inicial en ingles para todo el sitio.
- [x] Definir enfoque geografico inicial en Miami, Florida.
- [ ] Crear brief SEO para clusters locales: school promotions, uniforms, events, reunions, embroidery, screen printing.
- [ ] Publicar primeras piezas de contenido en ingles orientadas a intencion local de Miami.
