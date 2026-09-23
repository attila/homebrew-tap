# attila/homebrew-tap

Homebrew tap for [`lore`](https://github.com/attila/lore), a local semantic
search MCP server for software patterns.

```sh
brew install attila/tap/lore
```

It installs the prebuilt release archives, verified against the checksums
published with each release. Apple silicon and Intel macOS are covered, along
with x86-64 Linux. Lore needs [Ollama](https://ollama.com) at runtime, which
this formula does not install: `brew install ollama`.

Issues and changes to lore itself belong in
[`attila/lore`](https://github.com/attila/lore). This repository holds
formulae and nothing else.
