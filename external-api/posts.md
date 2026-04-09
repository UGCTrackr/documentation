# Posts

Post responses only expose fields currently shown in the UGC Trackr posts table, plus a stable `post_id`.

## Fields

Each post object includes:

- `post_id`
- `username`
- `platform`
- `title`
- `link`
- `posted_at`
- `views`
- `likes`
- `shares`
- `saves`
- `comments`

## List posts

```http
GET /posts
```

### Query parameters

- `campaign_id`
- `campaign_ids`
- `creator_id`
- `creator_ids`
- `platform`
- `start_date`
- `end_date`
- `min_views`
- `tracked_only`
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
curl -s "https://app.ugctrackr.com/api/external/v1/posts?limit=10&sort=posted_at&order=desc" \
  -H "Authorization: Bearer YOUR_API_KEY"
```

### Example response

```json
{
  "data": [
    {
      "post_id": "a65a61cf-6e80-4c36-bf60-5b7143f6f682",
      "username": "@creatorname",
      "platform": "tiktok",
      "title": "Three hook ideas for your next UGC video",
      "link": "https://www.tiktok.com/example",
      "posted_at": "2026-03-18T15:42:00+00:00",
      "views": 12000,
      "likes": 640,
      "comments": 25,
      "shares": 14,
      "saves": 33
    }
  ],
  "meta": {
    "count": 1,
    "limit": 10,
    "next_cursor": null
  }
}
```

## Get one post

```http
GET /posts/:postId
```

### Optional include values

- `campaign`
- `metrics_history`

### Example

```bash
curl -s "https://app.ugctrackr.com/api/external/v1/posts/POST_ID" \
  -H "Authorization: Bearer YOUR_API_KEY"
```

## Title behavior

The API returns `title` as:

```text
hook || title
```

That matches how the app currently renders the Title column.

## Content traits

Single-post responses include Gemini-analyzed content traits from `posts_meta` by default.

Example:

```bash
curl -s "https://app.ugctrackr.com/api/external/v1/posts/POST_ID" \
  -H "Authorization: Bearer YOUR_API_KEY"
```

Response shape:

```json
{
  "data": {
    "post_id": "a65a61cf-6e80-4c36-bf60-5b7143f6f682",
    "username": "@creatorname",
    "platform": "tiktok",
    "title": "Three hook ideas for your next UGC video",
    "link": "https://www.tiktok.com/example",
    "posted_at": "2026-03-18T15:42:00+00:00",
    "views": 12000,
    "likes": 640,
    "comments": 25,
    "shares": 14,
    "saves": 33,
    "content_traits": {
      "hook": "Three hook ideas for your next UGC video",
      "format_type": "Hook + Demo",
      "expression": "Excited",
      "location": "Kitchen"
    }
  },
  "meta": {}
}
```

If traits are not available yet, `content_traits` is still returned and its fields are `null`.
