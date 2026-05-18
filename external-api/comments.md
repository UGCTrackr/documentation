# Comments

Comment Tracking endpoints expose read-only comment intelligence for analyzed TikTok posts.

Comment data is only available after comments have been scraped and analyzed in UGC Trackr. These endpoints do not trigger scraping or refresh jobs.

## Summary

```http
GET /comments/summary
```

Returns aggregate Comment Tracking metrics across matching tracked posts.

### Query parameters

- `campaign_id`
- `campaign_ids`
- `creator_id`
- `creator_ids`
- `platform`
- `start_date`
- `end_date`

### Example

```bash
curl -s "https://app.ugctrackr.com/api/external/v1/comments/summary?campaign_id=CAMPAIGN_ID" \
  -H "Authorization: Bearer YOUR_API_KEY"
```

### Example response

```json
{
  "data": {
    "analyzed_posts_count": 12,
    "total_comments_count": 430,
    "last_scraped_at": "2026-05-14T18:00:00+00:00",
    "sentiment_score_100": 42,
    "on_topic_score_100": 88,
    "brand_mention_count": 17,
    "positive_count": 120,
    "neutral_count": 75,
    "negative_count": 235,
    "on_topic_count": 320,
    "off_topic_count": 53,
    "negative_feedback_count": 57,
    "curiosity_driver_count": 22,
    "social_proof_count": 11,
    "word_of_mouth_count": 8,
    "feature_highlight_count": 19,
    "none_count": 370,
    "sentiment_breakdown": {
      "positive": { "count": 120, "percent": 27.91 },
      "neutral": { "count": 75, "percent": 17.44 },
      "negative": { "count": 235, "percent": 54.65 }
    },
    "relevance_breakdown": {
      "on_topic": { "count": 320, "percent": 74.42 },
      "off_topic": { "count": 53, "percent": 12.33 },
      "negative_feedback": { "count": 57, "percent": 13.26 }
    },
    "type_breakdown": {
      "curiosity_driver": { "count": 22, "percent": 5.12 },
      "social_proof": { "count": 11, "percent": 2.56 },
      "word_of_mouth": { "count": 8, "percent": 1.86 },
      "feature_highlight": { "count": 19, "percent": 4.42 },
      "none": { "count": 370, "percent": 86.05 }
    }
  },
  "meta": {
    "timezone": "America/Los_Angeles"
  }
}
```

`on_topic_score_100` counts both `on_topic` and `negative_feedback` comments as relevant conversation. The raw relevance breakdown keeps those buckets separate.

## List comments

```http
GET /comments
```

Returns analyzed comment rows with safe public fields and minimal post context.

### Query parameters

- `campaign_id`
- `campaign_ids`
- `creator_id`
- `creator_ids`
- `post_id`
- `platform`
- `start_date`
- `end_date`
- `sentiment_label`
- `relevance_label`
- `promotion_type`
- `limit`
- `cursor`
- `sort`
- `order`

### Supported sort fields

- `like_count`
- `posted_at`

### Label filters

`sentiment_label` may be `positive`, `neutral`, or `negative`.

`relevance_label` may be `on_topic`, `off_topic`, or `negative_feedback`.

`promotion_type` may be `curiosity_driver`, `social_proof`, `word_of_mouth`, `feature_highlight`, or `none`.

### Example

```bash
curl -s "https://app.ugctrackr.com/api/external/v1/comments?campaign_id=CAMPAIGN_ID&limit=10" \
  -H "Authorization: Bearer YOUR_API_KEY"
```

### Example response

```json
{
  "data": [
    {
      "comment_id": "b7d03a26-3a0d-407e-85d2-09d59f2c3d1a",
      "post_id": "a65a61cf-6e80-4c36-bf60-5b7143f6f682",
      "campaign_id": "8b0e8072-2eb6-4b9d-bc9b-43f11f0cc1d3",
      "text": "this is cyberbulling",
      "username": "about_m4riaa",
      "display_name": null,
      "posted_at": null,
      "like_count": 84,
      "reply_count": 0,
      "region": null,
      "language": "en",
      "sentiment_label": "negative",
      "relevance_label": "negative_feedback",
      "promotion_type": "none",
      "post": {
        "post_id": "a65a61cf-6e80-4c36-bf60-5b7143f6f682",
        "campaign_id": "8b0e8072-2eb6-4b9d-bc9b-43f11f0cc1d3",
        "platform": "tiktok",
        "username": "@creatorname",
        "title": "Three hook ideas for your next UGC video",
        "link": "https://www.tiktok.com/example",
        "posted_at": "2026-03-18T15:42:00+00:00",
        "views": 12000,
        "likes": 640,
        "comments": 25,
        "shares": 14,
        "saves": 33
      }
    }
  ],
  "meta": {
    "count": 1,
    "limit": 10,
    "next_cursor": null,
    "timezone": "America/Los_Angeles"
  }
}
```

## Top posts

```http
GET /comments/top-posts
```

Returns top tracked posts by views with the highest-liked analyzed comment for each post.

### Query parameters

- `campaign_id`
- `campaign_ids`
- `creator_id`
- `creator_ids`
- `platform`
- `start_date`
- `end_date`
- `limit`

### Example

```bash
curl -s "https://app.ugctrackr.com/api/external/v1/comments/top-posts?campaign_id=CAMPAIGN_ID&limit=10" \
  -H "Authorization: Bearer YOUR_API_KEY"
```

## Privacy

The comments API does not expose internal/platform IDs such as `platform_comment_id`, `platform_post_id`, `user_platform_id`, or `user_profile_url`.
