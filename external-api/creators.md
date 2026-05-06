# Creators

The creators endpoint is designed for leaderboard and dashboard use cases.

## Fields

Each creator object includes:

- `creator_id`
- `full_name`
- `email`
- `tier`
- `is_active`
- `gender`
- `birthday`
- `location_label`
- `school_name`
- `graduation_year`
- `preferred_campaign_volume`
- `profile_interests`
- `post_count`
- `total_views`
- `campaign_count`
- `active_campaign_count`
- `handle_count`
- `active_handle_count`
- `campaigns`

`is_active` is the creator-level active status.

Each `campaigns` item includes:

- `campaign_id`
- `name`
- `handles`

Each `campaigns[].handles` item includes:

- `handle_id`
- `handle`
- `platform`
- `is_active`

`campaigns[].handles[].is_active` is the handle-level active status.

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
- `gender`
- `location`
- `school`
- `graduation_year`
- `preferred_campaign_volume`
- `interest`
- `min_age`
- `max_age`
- `campaign_count`
- `active_campaign_count`
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
- `campaign_count` is the number of grouped campaigns with creator handles in the filtered result set.
- `active_campaign_count` is the number of grouped campaigns with active creator handles on active campaigns in the filtered result set.
- `handle_count` is the number of creator handles in the filtered result set.
- `active_handle_count` is the number of active creator handles in the filtered result set.

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
      "email": "jane@example.com",
      "tier": "Silver",
      "is_active": true,
      "gender": "Female",
      "birthday": "2001-05-14",
      "location_label": "Austin, TX",
      "school_name": "University of Texas at Austin",
      "graduation_year": 2024,
      "preferred_campaign_volume": "3-4 campaigns",
      "profile_interests": [
        "fitness_wellness",
        "travel"
      ],
      "post_count": 18,
      "total_views": 224100,
      "campaign_count": 2,
      "active_campaign_count": 1,
      "handle_count": 3,
      "active_handle_count": 2,
      "campaigns": [
        {
          "campaign_id": "8b0e8072-2eb6-4b9d-bc9b-43f11f0cc1d3",
          "name": "Spring Creator Push",
          "handles": [
            {
              "handle_id": "4bbf47d2-b7db-42fb-a70a-5df489cd2059",
              "handle": "janecreator",
              "platform": "tiktok",
              "is_active": true
            }
          ]
        },
        {
          "campaign_id": "d0b87a98-6b4f-4d8f-95e5-f73f80c24696",
          "name": "Summer Retention",
          "handles": [
            {
              "handle_id": "d89cf04d-2cd9-4d04-b36d-012c4ef5728b",
              "handle": "jane.creator",
              "platform": "instagram",
              "is_active": false
            }
          ]
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

### Creator detail filters

You can filter creators by the same profile fields used in the app:

- `gender`
- `location`
- `school`
- `graduation_year`
- `preferred_campaign_volume`
- `interest`
- `min_age`
- `max_age`

Use repeated query parameters for text filters that may contain commas, such as `location`, `school`, `gender`, and `preferred_campaign_volume`. The `interest` filter accepts comma-separated values and matches any value in `profile_interests`. Age filters are applied to the stored `birthday`; the response returns `birthday`, not a computed age.

Example:

```bash
curl -s "https://app.ugctrackr.com/api/external/v1/creators?gender=Female&location=New%20York%2C%20NY&location=Chicago%2C%20IL&interest=travel,fitness_wellness&min_age=18&max_age=24" \
  -H "Authorization: Bearer YOUR_API_KEY"
```

### Campaign count filters

You can filter creators by campaign count buckets with `campaign_count` and `active_campaign_count`.

Supported buckets:

- `0`
- `1`
- `2`
- `3+`

Example:

```bash
curl -s "https://app.ugctrackr.com/api/external/v1/creators?active_campaign_count=3%2B" \
  -H "Authorization: Bearer YOUR_API_KEY"
```

### Active status filter

You can filter creators by active status with `is_active=true` or `is_active=false`.

Example:

```bash
curl -s "https://app.ugctrackr.com/api/external/v1/creators?is_active=true" \
  -H "Authorization: Bearer YOUR_API_KEY"
```
