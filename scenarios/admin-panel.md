# Admin Panel Guidelines

Admin panels should prioritize control, auditability, and safe management of
system data.

## UX Priorities

- Use predictable navigation.
- Make destructive actions explicit and confirmed.
- Show permission boundaries clearly.
- Prefer tables, filters, detail pages, and modals over decorative layouts.
- Make system state easy to inspect.

## Expected Features

- User management
- Role and permission management
- System settings
- Audit logs
- Entity management screens
- Search, filtering, sorting, and pagination
- Confirmation flows for destructive actions

## Safety

- Require confirmation for destructive or irreversible actions.
- Prefer disable/archive over delete where data must be retained.
- Show who made important changes and when.
- Restrict high-risk actions to authorized roles.
- Validate all admin inputs on the backend.

## Avoid

- Silent destructive actions.
- Admin-only frontend checks without backend authorization.
- Exposing raw internal errors to admins.
- Unpaginated large data tables.
