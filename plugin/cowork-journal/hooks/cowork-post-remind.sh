#!/bin/bash
# cowork-journal: Remind agent to write co-work entry after first file modification
COWORK_DIR="${CLAUDE_PROJECT_DIR:-.}/.cowork"
MARKER="$COWORK_DIR/.session-reminded"

# Only fire once per session
[ -f "$MARKER" ] && exit 0
[ ! -d "$COWORK_DIR" ] && exit 0

touch "$MARKER"

TODAY=$(date +%Y-%m-%d)
echo "[Co-Work] You modified project files. Write a journal entry to .cowork/$TODAY.md when your task is complete."
echo "Agent name: use your own name (claude/codex). Format: .cowork/README.md"
exit 0
