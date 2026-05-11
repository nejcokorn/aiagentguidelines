# Single Page Application Guidelines

Single page applications should provide a focused interactive experience with
clear state management and fast user feedback.

## UX Priorities

- Keep the primary interaction visible and responsive.
- Avoid unnecessary page transitions.
- Use local state for local interactions.
- Use server state tools for remote data.
- Show loading and error states close to the affected UI.

## Expected Features

- Clear primary workflow
- Responsive layout
- Form validation where forms exist
- Persistent state only when useful
- Error handling
- Empty states
- Keyboard and accessibility support for interactive controls

## State Management

- Use component state for isolated UI state.
- Use TanStack Query for server state.
- Use URL state for filters, tabs, search, and shareable views where useful.
- Avoid global state unless multiple distant parts of the app need the same
  state.

## Performance

- Keep initial load small.
- Avoid unnecessary client-side JavaScript.
- Split heavy components if needed.
- Debounce expensive search or filtering interactions.
- Avoid repeated network requests for the same data.

## Avoid

- Global state for simple component behavior.
- Mock-only interactions when a real workflow is expected.
- Hidden errors in console only.
- UI that resets unexpectedly after small interactions.
