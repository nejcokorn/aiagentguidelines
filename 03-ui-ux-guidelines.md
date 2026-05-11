# UI And UX Guidelines

These guidelines apply to web pages, SPAs, CRM systems, SaaS products, admin
panels, and internal tools.

## General UX

- Prioritize clarity, speed, and predictable workflows.
- Use responsive layouts that work on mobile, tablet, and desktop.
- Design screens around actual user tasks, not decorative sections.
- Keep text concise and specific to the domain.
- Avoid visible instructional text that explains obvious UI behavior.
- Use consistent spacing, typography, button hierarchy, and interaction states.

## Layout

- Use full-width application shells for products and tools.
- Use sidebars, top bars, tabs, tables, filters, and detail panels where they
  improve repeated work.
- Do not place cards inside cards.
- Do not style every page section as a floating card.
- Keep dashboard and CRM interfaces dense but readable.
- Ensure text never overlaps, clips, or overflows its container.

## Components

Expected components for product interfaces:

- Navigation shell
- Entity tables
- Search and filters
- Sort controls
- Pagination
- Detail views
- Create and edit forms
- Delete confirmation
- Toast notifications
- Modal dialogs
- Tabs
- Empty states
- Loading states
- Error states
- Permission states

## Visual Style

- Use restrained visual styling for CRM, SaaS, and admin products.
- Avoid one-note color palettes dominated by a single hue.
- Avoid decorative gradient blobs, abstract orbs, and generic AI visuals.
- Use icons for common actions when available.
- Use cards mainly for repeated items, modals, and clearly framed tools.
- Prefer useful visual hierarchy over heavy decoration.

## Forms

- Every form must show validation feedback.
- Required fields must be clear.
- Use appropriate controls:
  - select or combobox for known option sets
  - checkbox or toggle for binary values
  - date picker for dates
  - textarea for longer notes
  - number input for numeric values
- Preserve entered values when validation fails.
- Show success and failure feedback after submission.

## Tables And Lists

- Support search, filtering, sorting, and pagination for large entity lists.
- Use meaningful columns based on the domain.
- Keep row actions predictable and close to the row.
- Provide empty states with a useful next action.
- Provide bulk actions only when they are safe and useful.

## Accessibility

- Use semantic HTML.
- Buttons must be buttons, links must be links.
- Inputs must have labels.
- Interactive controls must be keyboard accessible.
- Maintain sufficient color contrast.
- Do not rely on color alone to communicate state.
