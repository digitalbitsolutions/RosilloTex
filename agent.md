# Agent Start Instructions (RosilloTex)

## Objetivo inmediato

Retomar rápido el proyecto local y avanzar con Sprint 1 (Astro base + WordPress headless).

## 1) Arranque de sesión

```powershell
cd d:\Meeguel\rosillotex
git pull
.\scripts\session-start.ps1
```

Esto ejecuta preflight, levanta Docker y valida WordPress.

## 2) Verificaciones rápidas

- WordPress: `http://localhost:18080`
- phpMyAdmin: `http://localhost:18081`
- Mailpit: `http://localhost:8025`

Si hay conflicto de puertos, ajustar `docker/.env` y relanzar `.\scripts\session-start.ps1`.

## 3) Ejecutar trabajo delegado (Sprint 1)

```powershell
.\scripts\delegate-sprint1.ps1 -AgentExecutable "codex" -WebhookUrl "TU_WEBHOOK"
```

Si tu ejecutable no es `codex`, cambia `-AgentExecutable`.

## 4) Donde ver resultado

- Reporte final: `reports/final-report.md`
- Log de ejecución: `reports/job-run.log`
- Job definido en: `docs/JOB-Sprint1.md`

## 5) Trabajo manual alternativo

Si no delegas, sigue:

- `docs/START-HERE.md`
- `docs/LOCAL-SETUP.md`
- `docs/TASKS.md`

## 6) Cierre al terminar

```powershell
.\scripts\session-stop.ps1
```

Reset total (solo si hace falta):

```powershell
.\scripts\session-stop.ps1 -PurgeVolumes
```

## Reglas básicas

- No subir secretos ni `.env` reales.
- Mantener cambios en ramas y commits pequeños.
- Validar build/lint antes de merge.
