# Campaigns

Campaign responses are intentionally minimal and only include the core fields most customers need.

## Fields

Each campaign object includes:

- `campaign_id`
- `name`
- `start_date`
- `end_date`
- `is_active`

## List campaigns

```http
GET /campaigns
```

### Query parameters

- `is_active`
- `platform`
- `start_date`
- `end_date`
- `limit`
- `cursor`

### Example

```bash
curl -s "https://app.ugctrackr.com/api/external/v1/campaigns?is_active=true" \
  -H "Authorization: Bearer YOUR_API_KEY"
```

### Example response

```json
{
  "data": [
    {
      "campaign_id": "8b0e8072-2eb6-4b9d-bc9b-43f11f0cc1d3",
      "name": "Spring Creator Push",
      "start_date": "2026-03-01",
      "end_date": "2026-03-31",
      "is_active": true
    }
  ],
  "meta": {
    "count": 1,
    "limit": 50,
    "next_cursor": null
  }
}
```

## Get one campaign

```http
GET /campaigns/:campaignId
```

### Optional include values

- `segments`
- `handles`
- `summary`

### Example

```bash
curl -s "https://app.ugctrackr.com/api/external/v1/campaigns/CAMPAIGN_ID?include=summary" \
  -H "Authorization: Bearer YOUR_API_KEY"
```

By default, the campaign payload remains minimal. Optional includes can add related data when needed.
