# Setup Guide

This file explains how to install SquareZero in another repository. It is not a
second source of agent instructions; the only SquareZero instruction file is
`AGENTS.md`.

## Recommended Target Structure

```text
AGENTS.md
AI_PROJECT_MEMORY.md
.ai-guidelines/
```

Use `.ai-guidelines/` as the SquareZero Git submodule. The target project's root
`AGENTS.md` should refer to `.ai-guidelines/AGENTS.md`.

## Quick Install

Run this from the root of the repository where you want to use SquareZero:

```bash
curl -fsSL https://raw.githubusercontent.com/nejcokorn/squarezero/main/scripts/install.sh | sh
```

The installer will:

- initialize Git in the target project if needed
- install or update SquareZero as a Git submodule in `.ai-guidelines/`
- create `AI_PROJECT_MEMORY.md` if it does not exist
- create or update `AGENTS.md`
- preserve existing `AGENTS.md` content outside the SquareZero managed block
- migrate an old `.ai-guidelines/ai-project-memory.md` file to
  `AI_PROJECT_MEMORY.md` when present

To use a different branch, repository, or target path:

```bash
SQUAREZERO_BRANCH=main \
SQUAREZERO_REPO_URL=https://github.com/nejcokorn/squarezero.git \
SQUAREZERO_TARGET_DIR=.ai-guidelines \
SQUAREZERO_MEMORY_FILE=AI_PROJECT_MEMORY.md \
SQUAREZERO_AGENTS_FILE=AGENTS.md \
sh /path/to/squarezero/scripts/install.sh
```

## Manual Submodule Setup

```bash
git submodule add https://github.com/nejcokorn/squarezero.git .ai-guidelines
git submodule update --init --recursive
```

Then create a root `AGENTS.md` in the target project:

```md
# AGENTS.md

Before making implementation changes, read and follow `.ai-guidelines/AGENTS.md`.
Also read `AI_PROJECT_MEMORY.md` if it exists.
```

After cloning a project that uses the submodule:

```bash
git submodule update --init --recursive
```
