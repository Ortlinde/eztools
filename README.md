# Ortlinde Tools

A collection of Claude Code plugins.

## Plugins

### [crlf-tab-formatter](plugin/crlf-tab-formatter)

Auto-formats code files on every edit — converts line endings to CRLF and 4-space indentation to tabs.

### [cowork-journal](plugin/cowork-journal)

Cross-agent collaboration journal for multi-AI workflows. Provides continuity when multiple agents (Claude Code, Codex) work on the same codebase.

### [unity-dev-rules](plugin/unity-dev-rules)

Unity coding standards, self-review checklist, deliberate-development workflow, and ShareLogger enforcement. Installs skills and commands to `~/.claude/` on session start.

## Install

```bash
# 加入 marketplace
/plugin marketplace add Ortlinde/eztools

# 安裝個別 plugin
/plugin install crlf-tab-formatter@ortlinde-tools
/plugin install cowork-journal@ortlinde-tools
/plugin install unity-dev-rules@ortlinde-tools
```

## License

MIT
