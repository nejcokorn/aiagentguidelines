# SquareZero AI Agent Guidelines

SquareZero is a SquareBase baseline for AI agents that build web products,
APIs, and supporting infrastructure.

All agent instructions are consolidated in one file:

```text
AGENTS.md
```

Projects that install SquareZero should point their root `AGENTS.md` at
`.ai-guidelines/AGENTS.md` and keep project-specific durable decisions in
`AI_PROJECT_MEMORY.md`.

## Setup

Quick install from the root of a target repository:

```bash
curl -fsSL https://raw.githubusercontent.com/nejcokorn/squarezero/main/scripts/install.sh | sh
```

For manual setup options, read `setup.md`.
