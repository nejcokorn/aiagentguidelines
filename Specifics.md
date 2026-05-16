# Sepecific behaviour

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