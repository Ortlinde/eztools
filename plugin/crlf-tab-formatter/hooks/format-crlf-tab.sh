#!/bin/bash
# crlf-tab-formatter hook
# Converts code files to CRLF line endings + 4-space → Tab indentation

INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // .tool_input.filePath // empty')

# No file path → skip
if [ -z "$FILE_PATH" ] || [ ! -f "$FILE_PATH" ]; then
  exit 0
fi

# Only process code files
case "$FILE_PATH" in
  *.js|*.ts|*.jsx|*.tsx|*.mjs|*.cjs|\
  *.py|*.go|*.rs|*.java|*.c|*.cpp|*.h|*.hpp|*.cs|\
  *.rb|*.php|*.swift|*.kt|*.scala|*.lua|\
  *.sh|*.bash|*.zsh|*.ps1|*.bat|*.cmd|\
  *.css|*.scss|*.less|*.sass|\
  *.html|*.htm|*.xml|*.svg|\
  *.json|*.yaml|*.yml|*.toml|*.ini|*.cfg|*.conf|\
  *.md|*.txt|*.rst|\
  *.sql|*.r|*.R|*.dart|*.zig|*.nim|*.ex|*.exs|\
  *.vue|*.svelte|*.astro)
    ;;
  *)
    exit 0
    ;;
esac

# 1) Convert 4 spaces → Tab
sed -i 's/    /\t/g' "$FILE_PATH"

# 2) Normalize to CRLF (strip existing \r first, then add \r)
sed -i 's/\r$//' "$FILE_PATH"
sed -i 's/$/\r/' "$FILE_PATH"

exit 0
