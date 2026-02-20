# Local Setup (Astro local + WordPress Docker)

## Objetivo

Trabajar en local con:

- Frontend Astro ejecutado en tu maquina.
- Backend WordPress dockerizado en Docker Desktop.

## Requisitos

- Windows + PowerShell.
- Docker Desktop activo.
- Node.js 22.12+.
- npm 10+.

## 1) Preparar variables Docker

```powershell
Copy-Item docker/.env.example docker/.env
```

Edita `docker/.env` y cambia passwords.

## 2) Levantar backend dockerizado

```powershell
.\scripts\dev-up.ps1
```

Servicios por defecto:

- WordPress: `http://localhost:18080`
- phpMyAdmin: `http://localhost:18081`
- Mailpit: `http://localhost:8025`
- MySQL host local: `127.0.0.1:3307`

## 3) Completar instalacion de WordPress

1. Abre `http://localhost:18080`.
2. Completa wizard inicial.
3. Entra a admin y activa plugins base (ACF, CPT UI, etc).

## 4) Ejecutar comandos WP-CLI

Usa el wrapper:

```powershell
.\scripts\wp.ps1 plugin list
.\scripts\wp.ps1 option get siteurl
```

## 5) Operacion diaria

- Ver logs:

```powershell
.\scripts\dev-logs.ps1
```

- Ver logs de un servicio:

```powershell
.\scripts\dev-logs.ps1 wordpress
```

- Parar entorno:

```powershell
.\scripts\dev-down.ps1
```

- Parar y borrar volumenes (reset total):

```powershell
.\scripts\dev-down.ps1 -Volumes
```

## 6) Frontend Astro local

Si aun no creaste Astro en este repo, ejecuta:

```powershell
npm create astro@latest apps/web -- --template basics --typescript strict --install --git false
```

Luego:

```powershell
cd apps/web
npm run dev
```

Frontend esperado: `http://localhost:4321`

## 7) Conexion Astro -> WordPress local

En variables del frontend usa:

- `PUBLIC_CMS_API_BASE=http://localhost:18080/wp-json/wp/v2`
- `WP_BASE_URL=http://localhost:18080`

Con esto puedes consumir posts/paginas desde el WordPress dockerizado.
