#!/bin/bash
# Injects the user's active ways rewrite mode as additionalContext.
#
# Usage: inject-mode.sh <hookEventName>
# Called by hooks/hooks.json for both SessionStart and UserPromptSubmit,
# passing the event name so the stdout JSON matches whichever event
# triggered it.
set -euo pipefail

EVENT_NAME="${1:-SessionStart}"

if [ -z "${CLAUDE_PLUGIN_DATA:-}" ] || [ -z "${CLAUDE_PLUGIN_ROOT:-}" ]; then
  exit 0
fi

CONFIG_FILE="${CLAUDE_PLUGIN_DATA}/config.json"
[ -f "$CONFIG_FILE" ] || exit 0

MODE=$(grep -o '"mode"[[:space:]]*:[[:space:]]*"[^"]*"' "$CONFIG_FILE" \
  | sed -E 's/.*:[[:space:]]*"([^"]*)"/\1/')
[ -n "$MODE" ] || exit 0

# Only allow lowercase letters and hyphens — MODE comes from a file on
# disk, so this guards against path traversal if it's ever malformed.
case "$MODE" in
  *[!a-z-]*) exit 0 ;;
esac

MODES_DIR="${CLAUDE_PLUGIN_ROOT}/skills/ways-rephrase/modes"
RULES_FILE="${MODES_DIR}/${MODE}.md"
[ -f "$RULES_FILE" ] || exit 0

SHARED_FILE="${MODES_DIR}/_shared.md"
SHARED=""
[ -f "$SHARED_FILE" ] && SHARED=$(cat "$SHARED_FILE")

RULES=$(cat "$RULES_FILE")
FULL_TEXT="The user has an active 'ways' rewrite mode set. Apply these rules to every response you write:

${SHARED}

${RULES}"

# Escape for JSON using bash's own substitution (portable — avoids GNU
# vs BSD sed differences): backslashes and quotes first, then real
# newlines -> literal \n.
ESCAPED=${FULL_TEXT//\\/\\\\}
ESCAPED=${ESCAPED//\"/\\\"}
ESCAPED=${ESCAPED//$'\n'/\\n}

printf '{"hookSpecificOutput": {"hookEventName": "%s", "additionalContext": "%s"}}\n' \
  "$EVENT_NAME" "$ESCAPED"
