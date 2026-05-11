# Security Guidelines

Security is a default requirement for every application, API, and workflow.

## Authentication

- Use a clear authentication strategy before building protected features.
- Do not store passwords in plain text.
- Hash passwords with a modern password hashing algorithm.
- Use secure session or token handling.
- Store secrets in environment variables or a managed secret system.
- Never commit secrets, tokens, private keys, or production credentials.

## Authorization

- Every protected backend endpoint must enforce authorization.
- Do not rely on frontend checks for security.
- Use role-based access control or permission-based access where appropriate.
- Check ownership for user-owned resources.
- Return safe error responses that do not expose internal details.

## Input Validation

- Validate all external input at the API boundary.
- Validate request bodies, query parameters, route parameters, headers, and file
  uploads.
- Use DTO validation in NestJS.
- Prefer structured validation libraries over ad hoc string checks.
- Reject unexpected fields when possible.

## Data Protection

- Minimize stored personal data.
- Avoid logging sensitive values.
- Mask secrets, tokens, passwords, and private personal data in logs.
- Use database constraints for important invariants.
- Use transactions for multi-step writes that must succeed or fail together.

## Web Security

- Protect against XSS by avoiding unsafe HTML rendering.
- Protect against CSRF where cookie-based authentication is used.
- Use secure HTTP headers.
- Configure CORS narrowly.
- Use rate limiting on authentication, public, and expensive endpoints.
- Sanitize file names and validate file types for uploads.

## Infrastructure Security

- Use least-privilege IAM permissions.
- Keep production and development environments separate.
- Do not expose databases, Redis, or internal services publicly.
- Use TLS for public traffic.
- Keep dependencies updated and remove unused packages.

## Auditability

- Log important security and business events.
- Track who performed critical actions and when.
- Use audit logs for permission changes, destructive actions, billing changes,
  and sensitive data access.
