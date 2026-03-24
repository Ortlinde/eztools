# crlf-tab-formatter

A Claude Code plugin that automatically formats code files after every edit:

- **Line endings** → CRLF (converts to \r\n)
- **Indentation** → Tabs (converts 4-space indentation)

## Install

```bash
# 加入 marketplace
/plugin marketplace add Ortlinde/crlf-tab-formatter

# 安裝 plugin
/plugin install crlf-tab-formatter@ortlinde-tools
```

## Supported file types

JavaScript/TypeScript, Python, Go, Rust, Java, C/C++, C#, Ruby, PHP, Swift, Kotlin, Scala, Lua, Shell scripts, CSS/SCSS/LESS, HTML/XML, JSON/YAML/TOML, Markdown, SQL, Dart, Zig, Nim, Elixir, Vue, Svelte, Astro, and more.

## How it works

Registers a `PostToolUse` hook on `Write|Edit|MultiEdit` events. After Claude edits any supported file, the hook script:

1. Converts 4-space indentation to tabs
2. Normalizes line endings to CRLF

## Customization

Edit `hooks/format-crlf-tab.sh` to:
- Add/remove file extensions in the `case` block
- Change indentation width (replace `'    '` pattern)
- Switch to LF instead of CRLF (remove the last `sed` command)

## License

MIT
