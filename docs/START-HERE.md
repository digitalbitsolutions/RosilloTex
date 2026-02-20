# Start Here

Guia rapida para retomar trabajo en pocas horas.

## 1) Arranque en un comando

```powershell
.\scripts\session-start.ps1
```

Esto hace preflight, levanta Docker backend y verifica WordPress.

## 2) Verificaciones rapidas

- WordPress: `http://localhost:18080`
- phpMyAdmin: `http://localhost:18081`
- Mailpit: `http://localhost:8025`

## 3) Si aun no existe frontend Astro

```powershell
.\scripts\session-start.ps1 -InitAstro
```

Luego:

```powershell
cd apps/web
npm run dev
```

## 4) Delegar trabajo a un agente

1. Edita `docs/JOB-Sprint1.md` o `docs/JOB.md`.
2. Ejecuta:

```powershell
.\scripts\delegate-job.ps1 `
  -AgentCommand "agent run --cwd d:\Meeguel\rosillotex --prompt-file docs/JOB-Sprint1.md --no-questions" `
  -WebhookUrl "https://hooks.slack.com/services/XXX/YYY/ZZZ"
```

Si tu CLI de agente usa otro nombre, cambia `agent` por el ejecutable real.

## 5) Cerrar sesion

```powershell
.\scripts\session-stop.ps1
```

Reset total (borra volumenes de DB/WP):

```powershell
.\scripts\session-stop.ps1 -PurgeVolumes
```
