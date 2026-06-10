#!/usr/bin/env bash
# install-rules.sh
# Installs Unity dev skills and commands from the plugin into ~/.claude/
# Idempotent: safe to run multiple times.

set -euo pipefail

PLUGIN_ROOT="${CLAUDE_PLUGIN_ROOT}"
TARGET="${HOME}/.claude"

# Ensure target directories exist
mkdir -p "${TARGET}/skills"
mkdir -p "${TARGET}/commands"

# Copy skills (each subdirectory of skills/)
SKILL_COUNT=0
if [ -d "${PLUGIN_ROOT}/skills" ]; then
  for skill_dir in "${PLUGIN_ROOT}/skills"/*/; do
    if [ -d "${skill_dir}" ]; then
      skill_name="$(basename "${skill_dir}")"
      cp -r "${skill_dir}" "${TARGET}/skills/${skill_name}"
      SKILL_COUNT=$((SKILL_COUNT + 1))
    fi
  done
fi

# Copy commands (each .md file in commands/)
CMD_COUNT=0
if [ -d "${PLUGIN_ROOT}/commands" ]; then
  for cmd_file in "${PLUGIN_ROOT}/commands"/*.md; do
    if [ -f "${cmd_file}" ]; then
      cp "${cmd_file}" "${TARGET}/commands/"
      CMD_COUNT=$((CMD_COUNT + 1))
    fi
  done
fi

echo "[unity-dev-rules] Installed ${SKILL_COUNT} skills and ${CMD_COUNT} commands to ~/.claude/"
