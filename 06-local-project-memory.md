# Local Project Memory Guidelines

Target projects should keep durable AI-agent decisions in a local project memory
file.

Recommended path:

```text
.ai-guidelines/ai-project-memory.md
```

This file belongs to the target project, not to the shared Square0 guideline
repository.

## Purpose

Use project memory to preserve decisions that should affect future prompts and
future implementation work.

Examples:

- The user decided this is a backend-only project.
- The user decided this is a frontend-only project.
- The backend and frontend live in separate folders.
- The frontend should call a specific backend service.
- The API base path, auth model, tenancy model, or deployment model was agreed.
- The user chose a convention that overrides the default Square0 guidance.
- A project-specific command should be used for linting, tests, or type checks.

## Agent Behavior

Before implementing, the agent should:

1. Read the repository `AGENTS.md`.
2. Read the Square0 guideline files referenced by `AGENTS.md`.
3. Read `.ai-guidelines/ai-project-memory.md` if it exists.
4. Apply project memory as project-specific guidance.

After discussing or implementing a durable decision, the agent should update
`.ai-guidelines/ai-project-memory.md`.

## Priority

Local project memory has priority over generic Square0 defaults because it
records decisions already agreed for the target project.

When instructions conflict, apply them in this order:

1. The user's latest explicit instruction
2. Target project `AGENTS.override.md`
3. Target project `AGENTS.md`
4. Target project local memory, usually `.ai-guidelines/ai-project-memory.md`
5. Square0 guideline files
6. Existing codebase conventions

If local project memory conflicts with the current user request, follow the
current user request and update local project memory when the new decision is
durable.

## What To Record

Record decisions that are likely to matter later:

- project type
- folder relationships
- frontend-backend integration rules
- selected auth approach
- selected deployment approach
- database ownership rules
- tenant or organization model
- API conventions
- local development commands
- testing commands
- user-approved deviations from Square0 defaults

## What Not To Record

Do not record:

- secrets
- passwords
- API keys
- private tokens
- temporary debug notes
- speculative ideas that were not agreed
- stale implementation details that should be discovered from code

## Suggested Format

```md
# AI Project Memory

This file records durable project decisions for AI agents.

## Project Shape

- Type: backend-only service
- Backend folder: `api/`
- Frontend folder: none

## Integration

- No frontend integration has been agreed yet.

## Architecture Decisions

- Use NestJS with Prisma and PostgreSQL.
- Use Redis and BullMQ only when background jobs are required.

## Commands

- Install: `npm install`
- Typecheck: `npm run typecheck`
- Test: `npm test`

## Overrides

- None.
```

## Multiple Projects In One Workspace

When a workspace contains multiple related projects, record the relationship
explicitly.

Example:

```md
## Project Shape

- Backend project: `portaldom-api/`
- Frontend project: `portaldom-web/`
- Shared guidelines: `.ai-guidelines/ai-guidelines/`

## Integration

- `portaldom-web/` calls `portaldom-api/`.
- Frontend API client lives in `portaldom-web/src/lib/api/`.
- Backend exposes REST endpoints under `/api`.
- Local backend URL: `http://localhost:3000`.
```
