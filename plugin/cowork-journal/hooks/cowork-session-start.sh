#!/bin/bash
# cowork-journal: Clean up session markers from previous session
COWORK_DIR="${CLAUDE_PROJECT_DIR:-.}/.cowork"
rm -f "$COWORK_DIR/.session-read" "$COWORK_DIR/.session-reminded" 2>/dev/null
exit 0
