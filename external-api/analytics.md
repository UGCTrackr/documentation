# Analytics

The current analytics surface is intentionally small and focused on the most useful summary data.

## Overview

```http
GET /analytics/overview
```

### Query parameters

- `campaign_id`
- `campaign_ids`
- `creator_id`
- `creator_ids`
- `platform`
- `start_date`
- `end_date`

### Response fields

- `total_posts`
- `total_views`
- `total_likes`
- `total_comments`
- `total_shares`
- `total_saves`
- `engagement_rate`
- `comment_rate`

### Example

```bash
curl -s "https://app.ugctrackr.com/api/external/v1/analytics/overview?start_date=2026-03-01&end_date=2026-03-19" \
  -H "Authorization: Bearer YOUR_API_KEY"
```

## Trending posts

```http
GET /analytics/posts/trending
```

This endpoint returns the same trimmed post object used by `GET /posts`, ordered by the requested metric.

### Query parameters

- `campaign_id`
- `campaign_ids`
- `creator_id`
- `creator_ids`
- `platform`
- `start_date`
- `end_date`
- `limit`
- `cursor`
- `sort`
- `order`

### Supported sort fields

- `posted_at`
- `views`
- `likes`
- `comments`
- `saves`

### Example

```bash
curl -s "https://app.ugctrackr.com/api/external/v1/analytics/posts/trending?limit=5&sort=views&order=desc" \
  -H "Authorization: Bearer YOUR_API_KEY"
```

## Timezone behavior

- Raw timestamps like `posted_at` are returned as stored.
- Reporting windows and date filters use Pacific time (`America/Los_Angeles`).
- A date like `2026-03-19` is interpreted as the Pacific business day.
