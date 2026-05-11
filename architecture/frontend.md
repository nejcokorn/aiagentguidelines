# Frontend Architecture

Use Next.js, TypeScript, Tailwind, and TanStack Query as the default frontend
stack.

## Structure

- Follow the existing Next.js app structure.
- Keep route components focused on composition and data boundaries.
- Extract reusable UI only when reuse is real.
- Keep domain-specific components close to their domain.
- Keep shared components generic and stable.

## Data Fetching

- Use TanStack Query for server state in interactive client flows.
- Use server-side loading where it fits the Next.js route model.
- Keep mutation logic explicit.
- Invalidate or update queries after successful mutations.
- Show loading, error, and empty states.

## Styling

- Use Tailwind utility classes consistently.
- Prefer responsive constraints over viewport-based font scaling.
- Keep application UI dense, aligned, and predictable.
- Avoid unrelated visual restyles during feature work.

## Forms

- Use explicit form validation.
- Preserve user input on validation errors.
- Disable submit only when it prevents real duplicate or invalid submission.
- Show success and failure feedback.
