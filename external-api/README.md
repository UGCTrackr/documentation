# External API

The UGC Trackr External API gives your team read-only access to campaign data, post data, and a small set of summary analytics.

It is designed to be simple to integrate, stable over time, and aligned with what you already see inside the UGC Trackr app.

## Base URL

Production:

```text
https://app.ugctrackr.com/api/external/v1
```

Local development:

```text
http://localhost:3000/api/external/v1
```

## What you can do

- list campaigns
- fetch a single campaign
- list creators
- list posts
- fetch a single post
- retrieve overview analytics
- retrieve trending posts

## Documentation

- [Authentication](./authentication.md)
- [Campaigns](./campaigns.md)
- [Creators](./creators.md)
- [Posts](./posts.md)
- [Analytics](./analytics.md)
- [Errors](./errors.md)

## Quick start

1. Create an API key in UGC Trackr under `Settings > API Access`.
2. Send that key as a bearer token in the `Authorization` header.
3. Start with `GET /campaigns` or `GET /posts`.

Example:

```bash
curl -s https://app.ugctrackr.com/api/external/v1/campaigns \
  -H "Authorization: Bearer YOUR_API_KEY"
```

## Important notes

- This API is read-only.
- API keys are scoped to a single team.
- Raw timestamps are returned as stored.
- Date-based filtering and reporting logic use Pacific time (`America/Los_Angeles`) so the API matches the app.
