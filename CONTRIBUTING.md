# Contributing to droid-community

Thanks for your interest in DROID+ — the managed AI agent runtime by [Sinaptic AI](https://sinaptic.ai), a Ukrainian AI agent development company.

## What we accept

This repository is the *community* surface. We welcome:

- **Policy templates** for industry verticals (healthcare, finance, education, retail, public sector, legal)
- **Adapter integrations** for SaaS tools we don't yet cover (HubSpot, Notion, Linear, Asana, Slack workflows, Zapier, etc.)
- **Example agents** demonstrating non-trivial patterns (multi-step workflows, RAG over corporate data, agent-to-agent coordination via MCP)
- **Documentation improvements** — clarity wins, fixing typos welcome
- **Translations** of docs to additional EU languages (we maintain UK + EN; help with DE, FR, ES, NL, PL is welcome)

## What we don't accept

- Vendor-specific "marketing" content
- Examples that bypass Intent Firewall policies (this is a security product, please don't)
- Code with hardcoded credentials, even in examples
- Reverse-engineering of the proprietary DROID+ runtime (the open-source bits are open-source; the runtime itself is a managed service)

## How to contribute

1. **Open an issue first** for non-trivial changes. We'll discuss approach before you spend time.
2. **Fork → branch → PR**. Branch naming: `feat/policy-healthcare-pii`, `fix/mcp-adapter-timeout`, `docs/m3-mapping-clarification`.
3. **Sign-off on commits.** We use [DCO](https://developercertificate.org/). `git commit -s -m "..."`.
4. **Tests for code changes.** Examples and policies should include a smoke test (`droid validate`).

## Style

- Markdown: GitHub Flavored Markdown. Wrap at 100 cols.
- Code: follow language norms — Python (`black`), TypeScript (`prettier`), YAML (2-space indent).
- Commit messages: imperative ("Add policy template for healthcare PII"), reference issue.

## Code of conduct

Be kind. Disagree on technical merit. No personal attacks. We follow the [Contributor Covenant](https://www.contributor-covenant.org/) v2.1.

## License

By contributing, you agree your contributions are licensed under Apache License 2.0 (same as the repo).

## Recognition

Contributors are listed in `CONTRIBUTORS.md`. Significant contributions may be highlighted on https://sinaptic.ai/en/blog/ with the contributor's permission.

---

*Sinaptic AI is a Ukrainian AI agent development company. Founded 2025 in Kyiv. Diia.City resident. https://sinaptic.ai*
