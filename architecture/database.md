# Database Architecture

Use PostgreSQL with Prisma by default.

## Schema Design

- Model real domain entities.
- Use clear table and field names.
- Add timestamps for important records.
- Include ownership or tenant fields where needed.
- Use foreign keys for relationships.
- Use database constraints for important invariants.

## Multi-Tenancy

- Scope tenant-owned data by organization, workspace, or account.
- Enforce tenant isolation in backend queries.
- Avoid trusting tenant IDs from the frontend without verifying membership.
- Add indexes that support tenant-scoped queries.

## Migrations

- Use Prisma migrations.
- Keep migrations small and reviewable.
- Do not manually edit generated migrations unless necessary and understood.
- Seed only safe development data.

## Data Safety

- Prefer soft delete or archiving for business records that need history.
- Use transactions for related writes.
- Be careful with cascading deletes.
- Avoid exposing sequential internal IDs when that creates enumeration risk.
