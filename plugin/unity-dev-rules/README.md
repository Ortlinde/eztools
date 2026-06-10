# unity-dev-rules

A Claude Code plugin that installs Unity development skills and workflow commands into `~/.claude/` on every session start.

## What It Does

On `SessionStart`, the plugin runs `hooks/install-rules.sh`, which copies skills and commands from the plugin directory into `~/.claude/skills/` and `~/.claude/commands/`. The install is idempotent.

## Installed Skills

| Skill | Purpose |
|-------|---------|
| `coding-standards` | Unity naming conventions, file structure, SOLID principles, and formatting rules. Invoke before writing or reviewing any code. |
| `deliberate-development` | Three-phase protocol (Understand -> Design -> Implement) for new features and architectural changes. |
| `self-review` | Risk & compliance checklist plus Self-Analysis Report templates. Trigger after code modifications >50 lines or refactoring. |
| `sharelogger-usage` | Replaces Debug.Log / Console.WriteLine with ShareLogger.Instance calls. Trigger whenever logging code is added or modified. |

## Installed Commands

| Command | Purpose |
|---------|---------|
| `/pullRules` | Pull rules from the my-cursor-rules GitHub repo into the current project. |
| `/pushRules` | Push local rules back to the my-cursor-rules GitHub repo. |
| `/syncSkills` | Scan all installed skills and rebuild the `<available_skills>` section in AGENTS.md. |

## References

Each skill includes reference documents under its `references/` subdirectory:

- `coding-standards/references/unity-style-guide.md` - Naming table, class layout, formatting rules
- `coding-standards/references/architecture-patterns.md` - SOLID examples, Strategy/Factory/State patterns
- `coding-standards/references/refactoring-guide.md` - Extract Method/Class, Parameter Object techniques
- `self-review/references/risk-checklist.md` - Consolidated checklist (style + Unity risk patterns)
- `self-review/references/analysis-report.md` - Pass / Warning / STOP report templates
