# Authentication

The External API uses bearer authentication with a team API key.

## Header

Send your API key in the `Authorization` header:

```http
Authorization: Bearer YOUR_API_KEY
```

## Where to get the API key

Generate and manage API keys in the UGC Trackr app under:

```text
Settings > API Access
```

Each API key is tied to one team. Every request made with that key is automatically scoped to that team.

## Example request

```bash
curl -s https://app.ugctrackr.com/api/external/v1/campaigns \
  -H "Authorization: Bearer YOUR_API_KEY"
```

## Notes

- API keys are scoped to a single team.
- Disabled API keys return `401 Unauthorized`.
- If a key is regenerated, the previous key stops working immediately.
