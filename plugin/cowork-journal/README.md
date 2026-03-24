# cowork-journal

Cross-agent collaboration journal for multi-AI workflows (Claude Code + Codex).

## What it does

When multiple AI agents work on the same codebase, this plugin provides continuity via a shared work journal.

| Hook | Trigger | Action |
|------|---------|--------|
| SessionStart | Every session | Clean up session markers |
| PreToolUse | First Write/Edit | Read today's co-work journal, inject as context |
| PostToolUse | First Write/Edit | Remind agent to write journal entry at session end |

## Prerequisites

Your project needs a `.cowork/` directory with a `README.md` describing the entry format.

Minimal setup:
```bash
mkdir .cowork
echo "# Co-Work Journal" > .cowork/README.md
echo "*" > .cowork/.gitignore
echo "!.gitignore" >> .cowork/.gitignore
echo "!README.md" >> .cowork/.gitignore
```

## Install

```bash
/plugin install cowork-journal@ortlinde-tools
```

## Journal Entry Format

Each day gets a file: `.cowork/YYYY-MM-DD.md`. Newest entries at top.

```markdown
## [HH:MM] agent-name | short-title

**Task:** One-line summary.

**Files Modified:**
- `relative/path` -- what changed

**Decisions:**
- Reasoning and trade-offs

**Notes for Next Agent:**
- Handoff items or (none)
```

## How it works

1. **SessionStart**: Cleans `.session-read` and `.session-reminded` markers
2. **PreToolUse** (Write/Edit): Reads `.cowork/YYYY-MM-DD.md` once, injects as context
3. **PostToolUse** (Write/Edit): Reminds agent once to write entry when task is complete

## License

MIT
