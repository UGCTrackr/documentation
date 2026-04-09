# Creators

The creators endpoint is designed for leaderboard and dashboard use cases.

## Fields

Each creator object includes:

- `creator_id`
- `full_name`
- `tier`
- `is_active`
- `post_count`
- `total_views`
- `campaign_count`
- `campaigns`

Each `campaigns` item includes:

- `campaign_id`
- `name`

## List creators

```http
GET /creators
```

### Query parameters

- `campaign_id`
- `campaign_ids`
- `platform`
- `is_active`
- `start_date`
- `end_date`
- `tier`
- `limit`
- `cursor`
- `sort`
- `order`

### Supported sort fields

- `full_name`
- `post_count`
- `total_views`
- `tier`

### Metric definitions

- `post_count` is the number of tracked posts attributed to the creator.
- `total_views` is the sum of views across the creator's tracked posts in the filtered result set.

### Example

```bash
curl -s "https://app.ugctrackr.com/api/external/v1/creators?sort=total_views&order=desc&limit=10" \
  -H "Authorization: Bearer YOUR_API_KEY"
```

### Example response

```json
{
  "data": [
    {
      "creator_id": "29f04232-5b4e-4d1a-b0f8-6d37a454979d",
      "full_name": "Jane Creator",
      "tier": "Silver",
      "is_active": true,
      "post_count": 18,
      "total_views": 224100,
      "campaign_count": 2,
      "campaigns": [
        {
          "campaign_id": "8b0e8072-2eb6-4b9d-bc9b-43f11f0cc1d3",
          "name": "Spring Creator Push"
        },
        {
          "campaign_id": "d0b87a98-6b4f-4d8f-95e5-f73f80c24696",
          "name": "Summer Retention"
        }
      ]
    }
  ],
  "meta": {
    "count": 1,
    "limit": 10,
    "next_cursor": null
  }
}
```

### Tier filter

You can filter creators by tier with `tier=training`, `tier=bronze`, `tier=silver`, or `tier=gold`.

Example:

```bash
curl -s "https://app.ugctrackr.com/api/external/v1/creators?tier=gold" \
  -H "Authorization: Bearer YOUR_API_KEY"
```

### Active status filter

You can filter creators by active status with `is_active=true` or `is_active=false`.

Example:

```bash
curl -s "https://app.ugctrackr.com/api/external/v1/creators?is_active=true" \
  -H "Authorization: Bearer YOUR_API_KEY"
```
