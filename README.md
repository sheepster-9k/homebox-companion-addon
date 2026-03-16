# Homebox Companion — Home Assistant Add-on Wrapper

> **This is NOT the Homebox Companion application itself.**
> This repository contains only a thin Home Assistant add-on wrapper
> (config.yaml, run.sh, Dockerfile) that packages the upstream
> [Homebox Companion](https://github.com/Duelion/homebox-companion)
> by [Duelion](https://github.com/Duelion) for installation via the
> HA Supervisor add-on system.

## What this repo does

- Pulls the **upstream Docker image** (`ghcr.io/duelion/homebox-companion`) at build time
- Adds a shell entrypoint (`run.sh`) that reads HA add-on options and maps them to the environment variables the upstream app expects
- Provides `config.yaml` so the HA Supervisor can present a configuration UI

**This repo contains zero application code.** All AI vision, inventory management, chat, and API logic belongs to the upstream project.

## What this repo does NOT do

- Modify, patch, or redistribute the Homebox Companion source code
- Claim authorship of any part of Homebox Companion
- Provide support for Homebox Companion itself — file upstream issues at [Duelion/homebox-companion](https://github.com/Duelion/homebox-companion/issues)

## Why not a fork?

A GitHub fork implies you are maintaining a variant of the upstream codebase. This repo does not contain the upstream source — it only wraps the pre-built Docker image. A fork would be misleading about the nature of the relationship.

## Installation

Add this repository URL in **Settings > Add-ons > Add-on Repositories**:

```
https://github.com/sheepster-9k/homebox-companion-addon
```

Then install **Homebox Companion** from the add-on store.

## Configuration

| Option | Description |
|--------|-------------|
| **Homebox URL** | URL of your Homebox instance (optional) |
| **LLM API Key** | API key for your LLM provider, or `local` for local models |
| **LLM API Base** | Base URL for the LLM API (leave blank for Ollama default) |
| **LLM Model** | Model name (e.g. `qwen3-vl:30b`) |
| **Allow Unsafe Models** | Allow models not on the upstream safe list |
| **Image Quality** | Quality preset for AI vision (raw/high/medium/low) |
| **CORS Origins** | Allowed CORS origins (leave blank for same-origin only) |

## Attribution & License

**The Homebox Companion application is created and maintained by [Duelion](https://github.com/Duelion).** This wrapper exists solely to make their work installable as an HA add-on.

- Upstream project: [github.com/Duelion/homebox-companion](https://github.com/Duelion/homebox-companion)
- Upstream license: [GPL-3.0](https://github.com/Duelion/homebox-companion/blob/main/LICENSE)

This wrapper is licensed under **GPL-3.0** to comply with the upstream license. See [LICENSE](LICENSE) for the full text.


## Related Projects

- [Homebox](https://github.com/sysadminsmedia/homebox) — The inventory management system
- [Homebox Companion](https://github.com/Duelion/homebox-companion) — AI-powered companion app (upstream)
- [Homebox Hub](https://github.com/sheepster-9k/homebox-hub) — HA custom integration for Homebox
- [Homebox MCP](https://github.com/sheepster-9k/homebox-mcp) — MCP server for Homebox (fork of [oangelo/homebox-mcp](https://github.com/oangelo/homebox-mcp))
