# CRM Guidelines

CRM applications should prioritize repeated work, fast lookup, and clear entity
relationships.

## UX Priorities

- Use dense but readable layouts.
- Prefer tables, filters, sidebars, tabs, split panes, and detail panels.
- Avoid marketing-style hero sections.
- Keep primary actions visible and predictable.
- Optimize for users who work in the system daily.

## Expected Features

- Dashboard with operational metrics
- Contact, company, deal, task, and activity entities when relevant
- Entity list views with search, filters, sorting, and pagination
- Entity detail views
- Create and edit forms
- Activity timeline
- Notes, reminders, and tasks
- Role-based access control
- Audit trail for important changes

## Entity Views

Every major entity should have:

- list view
- detail view
- create flow
- edit flow
- delete or archive flow when appropriate
- loading state
- empty state
- error state
- permission-restricted state

## CRM Data Rules

- Preserve history for important customer interactions.
- Prefer archiving over hard deletion for business records.
- Track ownership where teams or sales users are involved.
- Include timestamps for important events.
- Make filtering by status, owner, date, and priority easy.

## Avoid

- Large decorative hero sections.
- Sparse dashboards with fake metrics only.
- Detail pages that hide important actions.
- Forms without validation or clear save/cancel behavior.
