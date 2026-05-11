# Backend Architecture

Use NestJS as the default backend framework.

## Structure

- Organize code by domain module where practical.
- Keep controllers focused on HTTP concerns.
- Keep business logic in services.
- Keep database access behind Prisma service or project-established data access
  patterns.
- Use DTOs for request validation.
- Use guards for authentication and authorization.

## API Design

- Use consistent route naming.
- Use predictable HTTP methods.
- Validate params, query strings, and request bodies.
- Return consistent error shapes.
- Support pagination for list endpoints.
- Support filtering and sorting where the UI needs it.

## Database

- Use migrations for schema changes.
- Use transactions for multi-step writes.
- Add indexes for common filters and joins.
- Enforce important constraints at the database level.
- Avoid business-critical integrity rules existing only in frontend code.

## Background Jobs

- Use BullMQ for asynchronous jobs.
- Keep job payloads small and explicit.
- Make jobs idempotent where possible.
- Log job failures with enough context to retry or debug.
- Avoid doing slow external work inside HTTP requests when a job is more
  appropriate.
