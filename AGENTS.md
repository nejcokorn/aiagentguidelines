# AGENTS.md

## Instruction Priority

Do not use defaults instructions to override a direct user instruction.
When a durable project decision changes, update `AI_PROJECT_MEMORY.md`.

## Project Access

- Read the existing codebase before implementing.
- Read `AI_PROJECT_MEMORY.md` before choosing architecture, folder structure,
  integration points, authentication, deployment, or commands.
- Treat `.ai-guidelines/` as shared guidance unless the task is to
  update itself.
- Follow existing components, naming, validation, folder structure, package
  manager, and command conventions.
- Keep changes scoped to the requested product surface.

## Required Technology Stack

Use these technologies for new services, web applications, features, and fixes
unless the user explicitly requests another stack or the existing project has
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
- Frontend component tests when useful
- Playwright for important browser workflows

## Product Defaults

- Build the primary usable workflow as the first screen.
- Do not create a landing page when the user asked for an app, CRM, SaaS tool,
  admin panel, internal system, or API.
- Do not ship placeholder dashboards, fake interactions, or decorative shells as
  completed product work.
- Identify the main user, their goal, and their repeated actions.
- Include loading, empty, validation error, server error, permission denied, and
  success states where the workflow can reach those states.
- Use realistic domain entities and names. Avoid generic names such as `item`,
  `object`, `data`, and `thing` when the domain is known.
- Design list views for filtering, sorting, pagination, and auditability.
- Prioritize incomplete requirements in this order: correct domain behavior,
  security and validation, complete workflow, maintainable architecture,
  responsive UI, visual polish.

## Backend Architecture

- Organize NestJS code by domain module where practical.
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
- Use full-width application shells for products and tools.
- Use sidebars, top bars, tabs, tables, filters, and detail panels where they
  improve repeated work.
- Keep dashboard, CRM, SaaS, and admin interfaces dense but readable.
- Do not place cards inside cards.
- Do not style every page section as a floating card.
- Use cards mainly for repeated items, modals, and clearly framed tools.
- Ensure text never overlaps, clips, or overflows its container.
- Avoid one-note color palettes dominated by a single hue.
- Avoid decorative gradient blobs, abstract orbs, and generic AI visuals.
- Use icons for common actions when available.
- Use semantic HTML.
- Buttons must be buttons and links must be links.
- Inputs must have labels.
- Interactive controls must be keyboard accessible.
- Maintain sufficient color contrast.
- Do not rely on color alone to communicate state.

## Forms, Tables, And Actions

- Every form must show validation feedback.
- Required fields must be clear.
- Preserve entered values when validation fails.
- Show success and failure feedback after submission.
- Use select or combobox controls for known option sets.
- Use checkbox or toggle controls for binary values.
- Use date pickers for dates.
- Use textarea controls for longer notes.
- Use number inputs for numeric values.
- Support search, filtering, sorting, and pagination for large entity lists.
- Use meaningful table columns based on the domain.
- Keep row actions predictable and close to the row.
- Provide empty states with a useful next action.
- Require confirmation for destructive actions.
- Use bulk actions only when they are safe and useful.

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
- Reject unexpected fields when possible.
- Minimize stored personal data.
- Avoid logging sensitive values.
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
- Use AWS with Terraform for cloud infrastructure.
- Prefer RDS for PostgreSQL.
- Prefer ElastiCache for Redis.
- Prefer S3 for file storage.
- Prefer CloudFront for public assets.
- Prefer CloudWatch or an equivalent system for logs and metrics.
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
- Use structured validation libraries instead of ad hoc string checks.
- Show useful user-facing errors in the frontend.
- Log actionable backend errors.
- Do not expose stack traces or internal implementation details to users.
- Use consistent API error codes or error shapes.
- Use the package manager already present in the project.
- Do not switch package managers unless requested.
- Run available linting, formatting, type checking, and tests before considering
  work complete.

## Documentation

- Write or update relevant documentation in the target project's `doc/` folder
  when implementing or changing a feature.
- Document user-facing behavior, setup steps, required configuration,
  environment variables, architecture decisions, integration decisions,
  operational notes, verification steps, and known limitations.
- Link important documentation from `README.md` when it is needed for
  onboarding, setup, or normal development.

## Local Project Memory

- Keep durable project decisions in `AI_PROJECT_MEMORY.md` in the target
  project root.
- Create `AI_PROJECT_MEMORY.md` when a durable project decision is made and the
  file does not exist.
- Record project type, folder relationships, frontend-backend integration rules,
  selected auth approach, selected deployment approach, database ownership rules,
  tenant model, API conventions, local commands, testing commands, and
  user-approved deviations from SquareZero defaults.
- Do not record secrets, passwords, API keys, private tokens, temporary debug
  notes, speculative ideas, or stale implementation details that should be read
  from code.

Use this starting format when creating the file:

```md
# AI Project Memory

This file records durable project decisions for AI agents.

## Project Shape

- Not decided yet.

## Integration

- Not decided yet.

## Architecture Decisions

- Follow SquareZero defaults unless project-specific decisions are recorded here.

## Commands

- Install: not recorded yet
- Typecheck: not recorded yet
- Test: not recorded yet

## Overrides

- None.
```

## CRM

- Prioritize repeated work, fast lookup, and clear entity relationships.
- Use tables, filters, sidebars, tabs, split panes, and detail panels.
- Include contact, company, deal, task, and activity entities when relevant.
- Provide list, detail, create, edit, archive or delete, loading, empty, error,
  and permission states for every major entity.
- Include activity timelines, notes, reminders, tasks, role-based access
  control, and audit trails when relevant.
- Preserve history for important customer interactions.
- Prefer archiving over hard deletion for business records.
- Track ownership where teams or sales users are involved.
- Make filtering by status, owner, date, and priority easy.
- Avoid large decorative hero sections, fake-only dashboards, hidden detail page
  actions, and forms without validation or clear save and cancel behavior.

## SaaS Dashboard

- Show the most important product state immediately.
- Make navigation between dashboard, settings, billing, users, and core product
  areas predictable.
- Use metrics only when they represent useful product information.
- Provide upgrade, billing, and permission states where relevant.
- Include workspace or organization switching when applicable.
- Include user management, team management, billing, settings, notifications,
  activity feed, and empty states when applicable.
- Scope data by organization or workspace.
- Enforce tenant isolation in the backend.
- Include membership roles and permissions.
- Avoid leaking IDs, names, or metadata across tenants.
- Avoid decorative analytics, landing-page sections inside the app, billing
  controls without confirmation and authorization, and settings that save
  silently without feedback.

## Admin Panel

- Prioritize control, auditability, and safe management of system data.
- Use predictable navigation, tables, filters, detail pages, and modals.
- Show permission boundaries clearly.
- Include user management, role and permission management, system settings,
  audit logs, entity management screens, search, filtering, sorting,
  pagination, and confirmation flows.
- Require confirmation for destructive or irreversible actions.
- Prefer disable or archive over delete where data must be retained.
- Show who made important changes and when.
- Restrict high-risk actions to authorized roles.
- Validate all admin inputs on the backend.
- Avoid silent destructive actions, admin-only frontend checks, raw internal
  errors, and unpaginated large data tables.

## Single Page Application

- Keep the primary interaction visible and responsive.
- Avoid unnecessary page transitions.
- Show loading and error states close to the affected UI.
- Include form validation where forms exist.
- Persist state only when useful.
- Support keyboard and accessibility behavior for interactive controls.
- Avoid mock-only interactions when a real workflow is expected.
- Avoid hidden console-only errors.
- Avoid UI that resets unexpectedly after small interactions.

## Landing Page

- Use this guidance only when the user asked for a landing page, marketing page,
  or public offer page.
- Make the product, brand, venue, person, or offer obvious in the first
  viewport.
- Use a strong first screen with relevant imagery when appropriate.
- Keep the primary call to action visible.
- Make supporting sections specific and credible.
- Ensure the first viewport hints at the next section on mobile and desktop.
- Include a hero, primary call to action, benefits or outcomes, product or
  service proof, social proof when available, pricing or package summary when
  relevant, FAQ, and final call to action.
- Use real or generated bitmap imagery when visual context matters.
- Avoid generic gradient-only hero sections, abstract SVG illustrations when a
  concrete image would communicate better, vague headlines, generic startup
  copy, and forms without validation and confirmation.

## Verification Checklist

Before considering work complete, verify the relevant items:

- Primary user workflow is implemented.
- Navigation to and from the workflow is clear.
- Empty, loading, error, permission, validation, and success states exist.
- Forms validate user input and preserve values after validation failure.
- Layout works on mobile and desktop.
- Text does not overflow or overlap.
- Tables and lists support expected search, filtering, sorting, and pagination.
- Destructive actions require confirmation.
- Protected endpoints enforce authentication and authorization.
- Tenant or ownership boundaries are enforced.
- Database writes preserve important invariants.
- Secrets are not hardcoded and sensitive data is not logged.
- Docker configuration is updated when services, ports, dependencies, or startup
  commands change.
- Type checking, linting, formatting, tests, and critical manual checks pass
  where available.
- Relevant documentation is written or updated.
- Completed changes are committed, and pushed when the target project has a Git
  remote.
