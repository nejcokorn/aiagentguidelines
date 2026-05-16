#!/usr/bin/env sh
set -eu

AGENTS_FILE="${AGENT_GUIDELINES_FILE:-AGENTS.md}"
BRANCH="${AGENT_GUIDELINES_BRANCH:-main}"
AGENTS_SOURCE_URL="${AGENT_GUIDELINES_SOURCE_URL:-}"
SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
LOCAL_AGENTS_SOURCE="$SCRIPT_DIR/../AGENTS.md"

AGENTS_BLOCK_START="<!-- agent-guidelines:start -->"
AGENTS_BLOCK_END="<!-- agent-guidelines:end -->"
TMP_SOURCE="$(mktemp)"
TMP_AGENTS="$(mktemp)"
TMP_EXISTING="$(mktemp)"

cleanup() {
  rm -f "$TMP_SOURCE" "$TMP_AGENTS" "$TMP_EXISTING"
}
trap cleanup EXIT HUP INT TERM

if [ -f "$LOCAL_AGENTS_SOURCE" ]; then
  cp "$LOCAL_AGENTS_SOURCE" "$TMP_SOURCE"
elif command -v curl >/dev/null 2>&1; then
  if [ -z "$AGENTS_SOURCE_URL" ]; then
    echo "AGENT_GUIDELINES_SOURCE_URL is required when install.sh is not run from a local clone."
    exit 1
  fi
  curl -fsSL "$AGENTS_SOURCE_URL" -o "$TMP_SOURCE"
elif command -v wget >/dev/null 2>&1; then
  if [ -z "$AGENTS_SOURCE_URL" ]; then
    echo "AGENT_GUIDELINES_SOURCE_URL is required when install.sh is not run from a local clone."
    exit 1
  fi
  wget -qO "$TMP_SOURCE" "$AGENTS_SOURCE_URL"
else
  echo "curl or wget is required when install.sh is not run from a local clone."
  exit 1
fi

{
  echo "$AGENTS_BLOCK_START"
  sed '1{/^# AGENTS.md$/d;}' "$TMP_SOURCE"
  echo "$AGENTS_BLOCK_END"
} > "$TMP_AGENTS"

if [ ! -f "$AGENTS_FILE" ]; then
  {
    echo "# AGENTS.md"
    echo
    cat "$TMP_AGENTS"
  } > "$AGENTS_FILE"
elif grep -q "$AGENTS_BLOCK_START" "$AGENTS_FILE"; then
  awk -v start="$AGENTS_BLOCK_START" -v end="$AGENTS_BLOCK_END" '
    $0 == start { skipping = 1; next }
    $0 == end { skipping = 0; next }
    skipping != 1 { print }
  ' "$AGENTS_FILE" > "$TMP_EXISTING"
  {
    cat "$TMP_EXISTING"
    echo
    cat "$TMP_AGENTS"
  } > "$AGENTS_FILE"
else
  {
    cat "$AGENTS_FILE"
    echo
    cat "$TMP_AGENTS"
  } > "$TMP_EXISTING"
  mv "$TMP_EXISTING" "$AGENTS_FILE"
fi

echo "Updated $AGENTS_FILE with agent guidelines."
