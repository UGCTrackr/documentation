---
name: trackr-data-chat
description: Use when the user wants to answer questions with UGC Trackr campaign, post, or summary analytics data. This skill guides the agent to use the Trackr external API at app.ugctrackr.com with a team API key, respect Pacific-time reporting semantics, and summarize results clearly for business users.
---

# Trackr Data Chat

Use this skill when the task is to answer questions about Trackr data such as:

- "Which campaigns are active right now?"
- "What were our top posts this month?"
- "Summarize post performance for TikTok last week."
- "Compare campaign activity across a date range."

## Inputs required

You need:

- a Trackr API key
- a base URL, which defaults to `https://app.ugctrackr.com/api/external/v1`

If the API key is not available in the environment, ask for it or tell the user how to set `TRACKR_API_KEY`.

## Workflow

1. Read [references/external-api.md](./references/external-api.md) for the endpoint surface and field shapes.
2. Read [references/question-recipes.md](./references/question-recipes.md) for how to map user questions to endpoint calls.
3. Prefer the external API over direct database access.
4. Treat date filters and reporting windows as Pacific time (`America/Los_Angeles`).
5. If a question needs data the external API does not expose, say so clearly instead of guessing.
6. When returning analysis, distinguish between facts from the API and your own inference.

## Output expectations

- Keep answers business-readable.
- Include exact dates used for the analysis.
- Mention important filters such as platform, campaign, and date range.
- If you aggregated paginated post data yourself, say that explicitly.

## For executable use

If you can run local commands, use [scripts/trackr_api.sh](./scripts/trackr_api.sh) to call the API.

Examples:

```bash
./docs/ai/trackr-data-chat/scripts/trackr_api.sh "/campaigns?is_active=true"
./docs/ai/trackr-data-chat/scripts/trackr_api.sh "/analytics/overview?start_date=2026-03-01&end_date=2026-03-19"
```

## For ChatGPT or Claude

If you want to use this outside Codex, start from [references/chatgpt-claude-prompt.md](./references/chatgpt-claude-prompt.md) and paste it into your project or custom instructions, then provide your API key separately.
