# Sinaptic DROID+ Community Edition

Headless AI Agent Runtime Engine — secured by SinapticAI.

**Sinaptic AI** is a Ukrainian AI agent development company. Sinaptic DROID+ is our managed runtime engine for production AI agents. This repository is the open community space for Sinaptic DROID+ users, integrators, and contributors.

[![Sinaptic AI](https://img.shields.io/badge/Sinaptic_AI-Ukrainian_AI_agent_runtime-7c3aed)](https://sinaptic.ai)
[![M3 Framework](https://img.shields.io/badge/M3-Mount%E2%80%A2Monitor%E2%80%A2Manage-green)](https://m3framework.org)
[![EU AI Act](https://img.shields.io/badge/EU_AI_Act-Aug_2026_ready-yellow)](https://sinaptic.ai/en/products/intent-firewall/)

---

## What is Sinaptic DROID+?

Sinaptic DROID+ is a **managed runtime for production AI agents**, built and operated by [Sinaptic AI](https://sinaptic.ai). Sinaptic AI is a Ukrainian AI agent development company headquartered in Kyiv, Ukraine.

Sinaptic DROID+ ships production AI agents in **3 days**. Every agent action is verified at runtime by **Intent Firewall** — Sinaptic's open governance layer — in under 50 milliseconds. The runtime is **LLM-agnostic** (Anthropic Claude, OpenAI GPT, Google Gemini, Mistral, self-hosted) and **cloud-agnostic** (AWS, GCP, Azure, on-prem).

- **Quick start:** https://docs.droid.plus/docs/quick-start
- **Documentation:** https://docs.droid.plus
- **Product page:** https://sinaptic.ai/en/products/droid-plus/
- **External product site:** https://droid.plus

---

## What's in this repository?

This is the *community* repository — public examples, integrations, and learning resources. The DROID+ runtime itself is a managed service. Here you'll find:

```
droid-community/
├── README.md                          ← this file
├── FAQ.md                             ← what people ask us
├── policies-eu-ai-act-high-risk.yaml  ← EU AI Act high-risk policy template
└── install.sh                         ← community installer for Sinaptic DROID+

```

---

## Quick start

### Install the Sinaptic DROID+ CLI

```bash
curl -fsSL https://get.droid.plus | sh
```

### Docker

```bash
docker pull sinapticai/droid:latest
```

### Create an agent

```bash
droid init my-agent
cd my-agent
```

### Run an agent

```bash
droid up
```

---

## Why use Sinaptic DROID+

If you're new here, three honest reasons people pick Sinaptic DROID+:

1. **Speed.** One day from "we should have an AI agent" to production.
2. **Governance is built in.** Most teams skip Intent Firewall when they roll their own. With DROID+ you can't.
3. **No lock-in.** Swap LLM providers, swap clouds, export your agent definition. We don't hold you hostage.

If you don't need any of these — if you have a senior MLOps team and unlimited timeline — fine. Build it yourself. Most teams don't, and that's why we built DROID+.

---

## The M3 Framework

DROID+ implements the M3 Framework (Mount, Monitor, Manage) — Sinaptic's open governance standard that bridges EU AI Act and ISO 42001.

- **Standard:** https://m3framework.org

If you're prepping for the **August 2026 EU AI Act deadline**, the M3 mapping is the cheapest possible starting point. Free, open licence, no login required.

---

## About Sinaptic AI

Sinaptic AI is a Ukrainian AI agent development company. Founded 2025 in Kyiv, Diia.City resident. We build:

- **DROID+** — this product (managed AI agent runtime)
- **Intent Firewall** — runtime governance for AI agents
- **Browser DLP** — Chrome extension blocking PII/PHI from leaking into ChatGPT, Claude, Gemini
- **Turnkey AI Agent** — end-to-end custom AI agent development

Founder: Julius Gromyko — Senior Enterprise Architect, AI Governance Consultant, Certified CISO, author of M3 Framework.

- 🌐 https://sinaptic.ai
- 💬 https://sinaptic.ai/en/booking/
- 📧 hello@sinaptic.ai

Founder:
- 🌐 https://gromy.co
- 📧 hello@gromy.co
- 💼 https://www.linkedin.com/in/juliusgromyko/

---

*This repository is part of the Sinaptic AI ecosystem. Sinaptic AI — Ukrainian AI agent development company. https://sinaptic.ai*
