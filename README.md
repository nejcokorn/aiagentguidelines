# Agent Guidelines

This repository contains baseline instructions for AI agents that build
production-oriented services, features, and fixes.

All project instructions live in:

```text
AGENTS.md
```

Do not split the instructions into multiple guideline files. Do not install or
reference a `.ai-guidelines/` directory in target projects.

## What AGENTS.md Covers

- Required stack: NestJS, PostgreSQL, Prisma, Redis, BullMQ, Next.js,
  TypeScript, Tailwind, TanStack Query, Docker, AWS, and Terraform.
- Testing expectations: backend unit and integration tests, API e2e tests,
  frontend component tests, and Playwright for important browser workflows.
- Product defaults, backend architecture, database rules, frontend architecture,
  UI and UX, forms and actions, security, infrastructure, code quality, and
  documentation.
- Documentation belongs in the target project's `docs/` folder when features
  are implemented or changed.

## Setup

Quick install from the root of a target repository:

```bash
curl -fsSL https://raw.githubusercontent.com/nejcokorn/agentguidelines/main/scripts/install.sh | sh
```

For manual setup options, read `setup.md`.
