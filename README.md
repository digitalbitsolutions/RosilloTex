# Rosillo Tex Web Platform

Portal B2B para Rosillo Tex con frontend en Astro y backend WordPress headless.

## Objetivo del repo

Este repositorio arranca con blueprint + plan operativo para construir:

- Sitio corporativo de alta conversion.
- Blog desde WordPress headless.
- Base para marketplace futuro con WooCommerce.

## Stack

- Frontend: Astro 6 + TypeScript + Tailwind.
- Backend CMS: WordPress headless.
- API inicial: WordPress REST API.
- Ecommerce futuro: WooCommerce Store API + REST API.

## Modo local (recomendado)

- Frontend local en tu maquina (`localhost:4321`).
- Backend dockerizado en Docker Desktop:
  - WordPress: `http://localhost:18080`
  - phpMyAdmin: `http://localhost:18081`
  - Mailpit: `http://localhost:8025`

## Estructura

- `docs/BLUEPRINT.md`: arquitectura objetivo.
- `docs/ROADMAP.md`: roadmap por fases.
- `docs/TASKS.md`: backlog inicial.
- `docs/MCP.md`: estrategia MCP.
- `docs/LOCAL-SETUP.md`: arranque local paso a paso.
- `docs/START-HERE.md`: reentrada rapida.
- `docker-compose.yml`: stack local de backend.
- `docker/.env.example`: variables para Docker.
- `scripts/`: utilidades de arranque local.

## Quickstart local

1. Copia variables Docker:

```powershell
Copy-Item docker/.env.example docker/.env
```

2. Levanta backend dockerizado:

```powershell
.\scripts\dev-up.ps1
```

3. Abre WordPress y completa instalacion:

- `http://localhost:18080`

4. Para parar servicios:

```powershell
.\scripts\dev-down.ps1
```

5. Para ver logs:

```powershell
.\scripts\dev-logs.ps1 wordpress
```

6. Arranque de sesion recomendado (preflight + backend):

```powershell
.\scripts\session-start.ps1
```

## Documentacion clave

- Blueprint tecnico: `docs/BLUEPRINT.md`
- Setup local: `docs/LOCAL-SETUP.md`
- Backlog operativo: `docs/TASKS.md`
- Reentrada rapida: `docs/START-HERE.md`
- Delegacion de trabajo: `docs/JOB.md`, `docs/JOB-Sprint1.md` y `scripts/delegate-job.ps1`

## Delegar a un agente (async)

1. Define la tarea en `docs/JOB.md`.
2. Ejecuta un comando de agente no interactivo con:

```powershell
.\scripts\delegate-job.ps1 `
  -AgentCommand "agent run --cwd d:\Meeguel\rosillotex --prompt-file docs/JOB.md --no-questions" `
  -WebhookUrl "https://hooks.slack.com/services/XXX/YYY/ZZZ"
```

Atajo para Sprint 1:

```powershell
.\scripts\delegate-sprint1.ps1 -WebhookUrl "https://hooks.slack.com/services/XXX/YYY/ZZZ"
```

Si tu ejecutable no se llama `agent`:

```powershell
.\scripts\delegate-sprint1.ps1 -AgentExecutable "codex" -WebhookUrl "https://hooks.slack.com/services/XXX/YYY/ZZZ"
```

3. Revisa resultados:

- `reports/final-report.md`
- `reports/job-run.log`
