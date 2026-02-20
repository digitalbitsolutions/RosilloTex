# MCP Strategy (Model Context Protocol)

Este proyecto puede beneficiarse de MCP para acelerar tareas repetitivas de desarrollo, contenido y operación.

## Objetivo

- Reducir trabajo manual al conectar asistentes con herramientas del proyecto.
- Estandarizar accesos a archivos, repositorio, documentación y APIs.
- Crear flujos reproducibles para ingeniería y marketing técnico.

## Servidores MCP recomendados

- Filesystem server:
  - Lectura/escritura segura del repo.
  - Búsqueda de componentes, contenidos y config.
- Git server:
  - Resumen de cambios, historial y revisión de PR.
- Docs/Web server:
  - Consulta de documentación oficial (Astro, WordPress, WooCommerce).
- HTTP/API server:
  - Pruebas sobre endpoints REST de WordPress/WooCommerce.

## Casos de uso prácticos

- Generación de páginas SEO a partir de plantillas.
- Validación de links internos y metadata.
- Revisión automática de consistencia entre CPT y frontend.
- Diagnóstico rápido de errores de integración API.

## Reglas operativas

- No exponer secretos en prompts ni logs.
- Usar `.env` y gestor de secretos para credenciales.
- Limitar permisos del servidor filesystem al path del proyecto.
- Registrar cambios sensibles (content model, endpoints, auth).

## Estructura sugerida de prompts internos

- Contexto: objetivo comercial de la tarea.
- Entradas: archivos fuente o endpoints.
- Restricciones: performance, SEO, tono de marca.
- Salida esperada: archivo o diff concreto.

## Integración con WordPress headless

- En desarrollo:
  - Consumir endpoints públicos para posts y páginas.
- En operación:
  - Endpoints autenticados solo para flujos de administración.
- Para WooCommerce:
  - Store API para experiencia de compra.
  - REST API para operaciones administrativas.

## Siguiente paso

Revisar `mcp/mcp.config.example.json` y adaptarlo al runtime MCP que uses en tu entorno (nombres de servidores, comandos y rutas).
