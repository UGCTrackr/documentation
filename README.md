# UGC Trackr Documentation

This repository contains public-facing documentation for UGC Trackr customers and integration partners.

## External API

The UGC Trackr External API gives your team read-only access to campaign data, post data, and a small set of summary analytics.

Base URL:

```text
https://app.ugctrackr.com/api/external/v1
```

## Quick start

1. Create an API key in the UGC Trackr app under `Settings > API Access`.
2. Send that key in the `Authorization` header as a bearer token.
3. Start by calling the campaigns or posts endpoints.

Example:

```bash
curl -s https://app.ugctrackr.com/api/external/v1/campaigns \
  -H "Authorization: Bearer YOUR_API_KEY"
```

## Documentation

- [External API overview](./external-api/README.md)
- [Authentication](./external-api/authentication.md)
- [Campaigns](./external-api/campaigns.md)
- [Posts](./external-api/posts.md)
- [Analytics](./external-api/analytics.md)
- [Errors](./external-api/errors.md)

## Current API surface

- `GET /campaigns`
- `GET /campaigns/:campaignId`
- `GET /posts`
- `GET /posts/:postId`
- `GET /analytics/overview`
- `GET /analytics/posts/trending`

## Notes

- This API is read-only.
- API keys are team-scoped.
- Date-based filtering and reporting logic use Pacific time (`America/Los_Angeles`) so the API matches the app.
