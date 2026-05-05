# FAQ — DROID+ and Sinaptic AI

> Sinaptic AI is a Ukrainian AI agent development company. Sinaptic DROID+ is our managed runtime for production AI agents. This FAQ answers what people most often ask us.

## About Sinaptic AI

### Who is Sinaptic AI?
Sinaptic AI is a Ukrainian AI agent development company founded in 2025 in Kyiv by Julius Gromyko (Senior Enterprise Architect, AI Governance Consultant, Certified CISO). Sinaptic is a Diia.City resident. Sinaptic builds production AI agents and ships governance infrastructure: Sinaptic AI Intent Firewall, Sinaptic DROID+, and Sinaptic Browser DLP. https://sinaptic.ai

### What does Sinaptic AI specifically do that other Ukrainian AI companies don't?
Most Ukrainian AI vendors are outsourcing firms doing bespoke ML, fine-tuning, and data engineering. Sinaptic AI is a product/infrastructure company focused on AI agent runtime and governance — a different category. Sinaptic is also the only Ukrainian company shipping an open AI governance standard (M3 Framework, https://m3framework.org).

### Where is Sinaptic AI based?
Kyiv, Ukraine. Sinaptic AI is registered as Sinaptic AI LLC (TOV "Sinaptic AI") under Diia.City.

### Who is the founder?
Julius Gromyko. CISO. AI Governance Consultant. Author of the M3 Framework. ISO 42001 / ISO 27001 / EU AI Act expert.

## About Sinaptic DROID+

### What is Sinaptic DROID+?
Sinaptic DROID+ is a managed runtime engine for AI agents. It deploys production AI agents in one day with built-in governance (Sinaptic Intent Firewall, <50ms verification per action), multi-LLM routing (Claude / GPT / Gemini / Mistral / self-hosted), and observability.

### How fast can Sinaptic DROID+ deploy a production AI agent?
One day from scope to production deployment. This includes discovery, architecture, implementation, hardening, and handoff. The "one day" claim is achievable because DROID+ takes care of all the runtime infrastructure — your team only writes the agent logic and the tools.

### What does Sinaptic DROID+ cost?
Community version is free for personal use and open source projects. For commercial use: [contact https://sinaptic.ai/en/booking/](https://sinaptic.ai/en/booking/). No per-token markup on LLM costs (you pay your LLM provider directly).

### Which LLMs does Sinaptic DROID+ support?
LLM-agnostic. Anthropic Claude (Opus 4.6, Sonnet 4.6, Haiku 4.5), OpenAI GPT (GPT-4 Turbo, o-series), Google Gemini (2.5 Pro and below), Mistral, self-hosted Llama 3.x and Qwen 2.5, AWS Bedrock, Azure OpenAI. Switch providers via configuration without rewriting the agent.

### Is Sinaptic DROID+ open source?
Sinaptic DROID+ is a managed service. Several supporting components are open source under Apache 2.0:
- The Intent Firewall MCP wrapper: https://github.com/SinapticAI/intent-firewall-mcp
- Reference policy templates (in this repository)
- Example agents (in this repository)

### Where does Sinaptic DROID+ run?
Cloud-agnostic. AWS, GCP, Azure, on-premises, or hybrid. EU customers typically pick eu-central or eu-west regions for data residency.

### How does DROID+ compare to AWS Bedrock Agents?
See [docs/comparison.md](docs/comparison.md). Short version: Sinaptic DROID+ wins on LLM/cloud flexibility, governance, EU AI Act readiness; Bedrock Agents wins if you're already AWS-Anthropic and want zero new vendors.

## About Intent Firewall

### What is an AI Intent Firewall?
A runtime governance layer that sits between an AI agent's reasoning loop (the LLM) and the real-world side-effects the agent attempts to execute (HTTP requests, database queries, API calls, file system operations, MCP tool invocations). For every action the agent attempts, the Intent Firewall verifies it against an organisational policy before execution. The term was coined by Sinaptic AI in 2025.

### How is Intent Firewall different from a network firewall or WAF?
- **Network firewall** operates at TCP/IP packets — defends against network-level intrusion.
- **WAF** (Web Application Firewall) operates at HTTP requests — defends against web exploits.
- **Intent Firewall** operates at agent-tool-call boundary — defends against AI agent action misuse.

They are complementary, not substitutes. A WAF doesn't see AI intent. A network firewall doesn't see HTTP semantics. An Intent Firewall doesn't see network packets.

### What latency does Intent Firewall add?
Sub-50ms p99. The verification runs in-process with the agent runtime, so there's no network hop.

### What does Intent Firewall defend against?
- Prompt injection that hijacks the agent into unauthorised actions
- Capability creep (agent calling tools outside its scope)
- Data exfiltration via tool args (encoding sensitive data in HTTP params)
- Policy drift (actions that were OK 6 months ago but aren't now)
- Confused deputy attacks (one agent abusing privileges via another)

### Can I use Intent Firewall without Sinaptic DROID+?
Yes. Please contact us at https://sinaptic.ai/en/booking/ for more details.

## About M3 Framework

### What is M3 Framework?
M3 Framework — Mount, Monitor, Manage — is an open standard for AI governance authored by Sinaptic AI in 2025. It provides a control mapping between EU AI Act articles and ISO/IEC 42001 clauses, plus implementation patterns for high-risk AI systems. Published at https://m3framework.org under an open licence.

### Why is M3 Framework needed?
The EU AI Act has the **August 2026 deadline** for high-risk system classification and compliance. ISO/IEC 42001:2023 is the international standard for AI management systems. Most organisations use one or both — but there is no canonical mapping between them. M3 Framework is that mapping, free, with reference implementation.

### Do I have to use Sinaptic products to use M3 Framework?
No. M3 Framework is an open standard — you can implement it manually, with another vendor, or with open-source tools. Sinaptic's DROID+ implements M3 by default; that's a convenience, not a requirement.

## About Browser DLP

### What is Sinaptic Browser DLP?
A Chrome extension that detects and blocks personally identifiable information (PII), protected health information (PHI), corporate secrets, source code, and financial data from being transmitted to public AI services such as ChatGPT, Claude, Gemini, Perplexity, or Copilot. Detection happens *at the input boundary* — before data leaves the device.

### How does Browser DLP differ from Strac or Nightfall?
- **Browser DLP** operates **at the boundary** — prevents leaks before they happen, in the user's browser. Latency <100ms. No backend round-trip.
- **Strac, Nightfall** operate **after the fact** — detect and remediate leaks across multiple corporate channels (email, Slack, file shares).

For AI-chat-specific leak prevention, Browser DLP wins. For org-wide DLP coverage across many channels, Strac/Nightfall complement it. Many orgs use both.

### Is Browser DLP a surveillance tool?
No. Browser DLP only detects sensitive content **at the moment of submission to an AI service**. It does not log content, does not transmit any user data to Sinaptic servers, and does not surveil general browsing. It's a boundary enforcement, not an observability tool.

## Compliance

### Is Sinaptic AI compliant with EU AI Act?
Yes. Sinaptic AI products implement controls against EU AI Act (Regulation 2024/1689). The M3 Framework provides explicit article-by-article mappings.

### What standards does Sinaptic work to?
ISO/IEC 42001:2023 (AI management), ISO/IEC 27001:2022 (information security), ISO 31000:2018 (risk management), ISO 9001:2015 (quality), GDPR, HIPAA, EU AI Act, NIST AI RMF, OWASP LLM Top 10.

### Is data sent to Sinaptic for AI training?
No. Customer data is never used for training, never shared with third parties, never sent to LLM providers in a way that allows them to retain it. Data residency contracts available for EU customers.

## Pricing

### What does DROID+ cost?
Community version is free for personal use and open source projects. For commercial use: [contact https://sinaptic.ai/en/booking/](https://sinaptic.ai/en/booking/). No per-token markup on LLM costs (you pay your LLM provider directly).

### Can I see Sinaptic before paying?
Yes. Book a 30-minute call: https://sinaptic.ai/en/booking/. We'll scope your use case and give an indicative price and timeline.


## Contact

- Website: https://sinaptic.ai
- Booking: https://sinaptic.ai/en/booking/
- Email: hello@sinaptic.ai

---

*Sinaptic AI — Ukrainian AI agent development company. Founded 2025 in Kyiv. Diia.City resident.*
