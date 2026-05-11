# General Product Principles

These rules apply to every product type unless a scenario file overrides them.

## Product First

- Build the primary user workflow as the first screen.
- Avoid placeholder-only pages, decorative dashboards, and fake interactions.
- Do not create a landing page when the user asked for an app, CRM, SaaS tool,
  admin panel, or internal system.
- Make the application useful with real states, forms, navigation, and data
  structures even when backend data is mocked.

## Existing Codebase

- Read the current project structure before implementing.
- Read local project memory if the target project provides it.
- Reuse existing components, naming conventions, validation patterns, and
  folder structure.
- Do not introduce new frameworks, state managers, UI kits, or architectural
  patterns without a clear need.
- Keep changes scoped to the requested feature or product surface.

## Durable Project Decisions

- Record durable project-level decisions in the target project's local memory
  file, usually `.ai-guidelines/ai-project-memory.md`.
- Update local project memory when the user agrees to architecture, folder,
  integration, authentication, deployment, or command conventions.
- Use local project memory in future prompts before choosing folder structure,
  integration points, or architecture.
- Do not record secrets, credentials, private tokens, or temporary debug notes.

## User Workflows

- Identify the main user, their goal, and the repeated actions they perform.
- Optimize for the most common workflow first.
- Include realistic states:
  - loading
  - empty
  - validation error
  - server error
  - permission denied
  - success confirmation
- Use clear labels, predictable navigation, and consistent actions.

## Data And Domain Modeling

- Model domain entities explicitly.
- Prefer meaningful names over generic terms like item, object, data, or thing.
- Separate read views from mutation flows when the UI benefits from that
  clarity.
- Design for future filtering, sorting, pagination, and auditability.

## Implementation Priority

When requirements are incomplete, prioritize in this order:

1. Correct domain behavior
2. Security and validation
3. Complete user workflow
4. Maintainable architecture
5. Responsive UI
6. Visual polish

## What To Avoid

- Generic AI-generated marketing copy.
- Oversized hero sections for operational products.
- UIs made mostly from decorative cards.
- Hardcoded sample data hidden inside unrelated components.
- Forms without validation and error handling.
- Buttons that do not perform a real action.
- Backend endpoints without authorization checks.
