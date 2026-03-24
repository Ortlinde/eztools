#!/bin/bash
# cowork-journal: Read today's (or yesterday's) co-work journal before first file edit
COWORK_DIR="${CLAUDE_PROJECT_DIR:-.}/.cowork"
MARKER="$COWORK_DIR/.session-read"

# Only fire once per session
[ -f "$MARKER" ] && exit 0
# Not a cowork-enabled project
[ ! -d "$COWORK_DIR" ] && exit 0

touch "$MARKER"

TODAY=$(date +%Y-%m-%d)
YESTERDAY=$(date -d "yesterday" +%Y-%m-%d 2>/dev/null || date -v-1d +%Y-%m-%d 2>/dev/null)

if [ -f "$COWORK_DIR/$TODAY.md" ]; then
  echo "[Co-Work] Today's journal ($TODAY):"
  echo "---"
  head -n 50 "$COWORK_DIR/$TODAY.md"
  echo "---"
elif [ -n "$YESTERDAY" ] && [ -f "$COWORK_DIR/$YESTERDAY.md" ]; then
  echo "[Co-Work] No entries today. Yesterday's journal ($YESTERDAY):"
  echo "---"
  head -n 50 "$COWORK_DIR/$YESTERDAY.md"
  echo "---"
else
  echo "[Co-Work] No recent journal entries."
fi

echo ""
echo "[Co-Work] Entry format: see .cowork/README.md"
exit 0
