# SaaS Dashboard Guidelines

SaaS dashboards should help users understand status, take action, and manage
their account or workspace.

## UX Priorities

- Show the most important product state immediately.
- Make navigation between dashboard, settings, billing, users, and core product
  areas predictable.
- Use metrics only when they represent useful product information.
- Provide clear upgrade, billing, and permission states where relevant.

## Expected Features

- Overview dashboard
- Core product workflow
- Workspace or organization switcher when applicable
- User and team management
- Billing or subscription area when applicable
- Settings
- Notifications or activity feed when useful
- Empty states that guide the next product action

## Dashboard Content

Dashboards should include a useful mix of:

- key metrics
- recent activity
- alerts or required actions
- quick actions
- status summaries
- links into deeper workflows

## Multi-Tenant SaaS

- Scope data by organization or workspace.
- Enforce tenant isolation in the backend.
- Include membership roles and permissions.
- Avoid leaking IDs, names, or metadata across tenants.

## Avoid

- Decorative analytics with no user value.
- Landing-page-style sections inside the app.
- Billing controls without confirmation and authorization.
- Settings pages that save silently without feedback.
