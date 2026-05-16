# AGENTS.md

## Instruction Priority

Do not use instructions in this file to override a direct user instruction.
Keep all project instructions in this `AGENTS.md` file.

## Project Access

- Read the existing codebase before implementing.
- Follow existing components, naming, validation, folder structure, package
  manager, and command conventions.
- Keep changes scoped to the requested product surface.

## Required Technology Stack

Use these technologies for new services, features, and fixes unless the
user explicitly requests another stack or the existing project has
already standardized on another stack.

Backend:

- NestJS
- PostgreSQL
- Prisma
- Redis for cache and pub/sub
- BullMQ for queue and job processing
- NestJS DTO validation
- `class-validator` and `class-transformer`

Frontend:

- Next.js
- TypeScript
- Tailwind
- TanStack Query

Infrastructure:

- Docker
- AWS
- Terraform

Testing:

- Backend unit and integration tests
- API e2e tests for critical flows
- Frontend component tests
- Playwright for important browser workflows

## Product Defaults

- Identify the user goal, and their repeated actions.
- Include loading, empty, validation error, server error, permission denied, and
  success states where the workflow can reach those states.
- Use realistic domain entities and names. Avoid generic names such as `item`,
  `object`, `data`, and `thing` when the domain is known.
- Design list views for filtering, sorting, pagination, and auditability.
- Prioritize incomplete requirements in this order: correct domain behavior,
  security and validation, complete workflow, maintainable architecture,
  responsive UI, visual polish.

## Backend Architecture

- Keep controllers focused on HTTP concerns.
- Put business logic in services.
- Use DTOs for request validation before business logic runs.
- Use guards for authentication and authorization.
- Access Prisma through a dedicated service or the project's established data
  access pattern.
- Use transactions for related writes that must succeed or fail together.
- Return consistent API response and error shapes.
- Validate route parameters, query parameters, request bodies, headers, and file
  uploads.
- Support pagination for list endpoints.
- Support filtering and sorting when the UI needs it.
- Avoid slow external work inside HTTP requests when a BullMQ job is more
  appropriate.
- Keep BullMQ job payloads small, explicit, and idempotent where possible.
- Log job failures with enough context to retry or debug.

## Database

- Use PostgreSQL with Prisma migrations.
- Model real domain entities with clear table and field names.
- Add timestamps for important records.
- Use foreign keys for relationships.
- Use database constraints for important invariants.
- Add indexes for common filters, joins, and tenant-scoped queries.
- Scope tenant-owned data by organization, workspace, or account.
- Enforce tenant isolation in backend queries.
- Verify tenant membership instead of trusting tenant IDs from the frontend.
- Prefer soft delete or archiving for business records that require history.
- Be careful with cascading deletes.
- Avoid exposing sequential internal IDs when that creates enumeration risk.
- Seed only safe development data.

## Frontend Architecture

- Follow the existing Next.js app structure.
- Use React Server Components where they fit the route model.
- Use client components for interactive UI.
- Use TanStack Query for server state, caching, refetching, and mutations.
- Use server-side loading where it fits the Next.js route model.
- Invalidate or update queries after successful mutations.
- Use local component state for isolated UI behavior.
- Use URL state for filters, tabs, search, and shareable views where useful.
- Avoid global state unless multiple distant parts of the app need the same
  state.
- Keep route components focused on composition and data boundaries.
- Keep domain-specific components close to their domain.
- Extract reusable components only when reuse is real.
- Keep shared components generic and stable.
- Use Tailwind utility classes consistently.
- Avoid unrelated visual restyles during feature work.
- Keep initial load small and avoid unnecessary client-side JavaScript.
- Debounce expensive search or filtering interactions.

## UI And UX

- Use responsive layouts that work on mobile, tablet, and desktop.
- Design screens around actual user tasks, not decorative sections.
- Use concise text specific to the domain.
- Avoid visible instructional text that explains obvious UI behavior.
- Use consistent spacing, typography, button hierarchy, and interaction states.
- Use sidebars, top bars, tabs, tables, filters, and detail panels where they
  improve repeated work.
- Use cards mainly for repeated items, modals, and clearly framed tools.
- Ensure text never overlaps, clips, or overflows its container.
- Use icons for common actions when available.
- Interactive controls must be keyboard accessible.

## Forms, Tables, And Actions

- Every form must show validation feedback.
- Preserve entered values when validation fails.
- Show success and failure feedback after submission.
- Require confirmation for destructive actions.

## Security

- Choose a clear authentication strategy before building protected features.
- Use secure session or token-based authentication depending on the product.
- Do not store passwords in plain text.
- Hash passwords with a modern password hashing algorithm.
- Store secrets in environment variables or a managed secret system.
- Never commit secrets, tokens, private keys, or production credentials.
- Use role-based access control or permission-based access for protected
  systems.
- Every protected backend endpoint must enforce authorization.
- Frontend permission checks may hide or disable UI, but backend checks are the
  security boundary.
- Check ownership for user-owned resources.
- Return safe error responses that do not expose internal details.
- Mask secrets, tokens, passwords, and private personal data in logs.
- Protect against XSS by avoiding unsafe HTML rendering.
- Protect against CSRF where cookie-based authentication is used.
- Use secure HTTP headers.
- Configure CORS narrowly.
- Use rate limiting on authentication, public, and expensive endpoints.
- Sanitize file names and validate file types for uploads.
- Log important security and business events.
- Track who performed critical actions and when.

## Infrastructure And Operations

- Keep application code Docker-ready for local development and deployment.
- Use separate containers for frontend, API, worker, PostgreSQL, and Redis.
- Keep development, staging, and production separate.
- Use environment variables for environment-specific configuration.
- Document required environment variables.
- Do not hardcode production URLs, credentials, regions, or account IDs.
- Manage cloud infrastructure with Terraform.
- Keep Terraform modules small and understandable.
- Keep Terraform state secure.
- Use least-privilege IAM policies.
- Do not expose databases, Redis, or internal services publicly.
- Use TLS for public traffic.
- Provide health checks for services.
- Monitor API errors, job failures, database health, and queue depth.
- Make deployments repeatable.

## Code Quality

- Use TypeScript throughout the frontend and backend.
- Prefer strict typing.
- Avoid `any` unless there is a documented reason.
- Model domain concepts with explicit types.
- Keep shared types close to the boundary where they are used unless a shared
  package already exists.
- Prefer clear code over clever code.
- Keep files reasonably small and cohesive.
- Avoid broad refactors while implementing unrelated features.
- Preserve existing project conventions unless there is a strong reason to
  change them.
- Log actionable backend errors.
- Do not expose stack traces or internal implementation details to users.
- Use consistent API error codes or error shapes.
- Use the package manager already present in the project.
- Setup linting, formatting, type checking but don't run it for every change
- Run tests before considering work complete.

## Documentation

- Write or update relevant documentation in the target project's `docs/` folder
  when implementing or changing a feature.
- Document user-facing behavior, setup steps, required configuration,
  environment variables, architecture decisions, integration decisions,
  operational notes, verification steps, and known limitations.
- Link important documentation from `README.md` when it is needed for
  onboarding, setup, or normal development.
