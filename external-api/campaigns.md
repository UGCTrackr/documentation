# Campaigns

Campaign responses are intentionally minimal and only include the core fields most customers need.

## Fields

Each campaign object includes:

- `campaign_id`
- `name`
- `start_date`
- `end_date`
- `is_active`
- `ugc_engineer`

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
      "is_active": true,
      "ugc_engineer": "Jane Smith"
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
- `metrics_history`

### Example

```bash
curl -s "https://app.ugctrackr.com/api/external/v1/campaigns/CAMPAIGN_ID?include=summary" \
  -H "Authorization: Bearer YOUR_API_KEY"
```

By default, the campaign payload remains minimal. Optional includes can add related data when needed.

## Metrics history

`include=metrics_history` adds daily campaign metrics from `campaign_metrics_daily` to the single-campaign response.

Example:

```bash
curl -s "https://app.ugctrackr.com/api/external/v1/campaigns/CAMPAIGN_ID?include=metrics_history" \
  -H "Authorization: Bearer YOUR_API_KEY"
```

Each `metrics_history` entry includes:

- `date`
- `views`
- `likes`
- `comments`
- `shares`
- `saves`
- `total_views`
- `total_likes`
- `total_comments`
- `total_shares`
- `total_saves`
- `active_posts_count`

The daily fields (`views`, `likes`, `comments`, `shares`, `saves`) represent the amount gained on that specific date.

The `total_*` fields represent the cumulative totals for that campaign up to and including that date. For example, `views` is the number of views gained that day, while `total_views` is the accumulated view count as of that day.
