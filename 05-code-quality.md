# Code Quality Guidelines

Code should be maintainable, explicit, and easy to extend.

## TypeScript

- Use TypeScript throughout the frontend and backend.
- Prefer strict typing.
- Avoid `any` unless there is a documented reason.
- Model domain concepts with explicit types.
- Keep shared types close to the boundary where they are used unless a shared
  package already exists.

## Backend

- Keep controllers thin.
- Put business logic in services.
- Validate DTOs before reaching business logic.
- Use Prisma through a dedicated service or repository pattern established by
  the project.
- Use transactions for related writes.
- Return consistent API response shapes.
- Handle expected errors explicitly.

## Frontend

- Keep components focused.
- Extract reusable components only when duplication is real.
- Keep data fetching separate from presentational rendering where practical.
- Use TanStack Query for server state.
- Use local component state for local UI behavior.
- Avoid global state unless the state is truly shared across distant parts of
  the application.

## Testing

- Add tests for business-critical behavior.
- Prefer focused tests over broad fragile tests.
- Use e2e tests for core user workflows.
- Test authorization and validation failures.
- Test important edge cases, not only the happy path.

## Error Handling

- Show useful user-facing errors in the frontend.
- Log actionable backend errors.
- Do not expose stack traces or internal implementation details to users.
- Use consistent error codes or error shapes for APIs.

## Configuration

- Keep environment-specific values in environment variables.
- Document required environment variables.
- Provide safe development defaults where appropriate.
- Do not hardcode production URLs, credentials, regions, or account IDs.

## Maintainability

- Prefer clear code over clever code.
- Keep files reasonably small and cohesive.
- Avoid broad refactors while implementing unrelated features.
- Preserve existing project conventions unless there is a strong reason to
  change them.
