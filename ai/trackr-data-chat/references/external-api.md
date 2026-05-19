# Trackr External API Reference

Base URL:

```text
https://app.ugctrackr.com/api/external/v1
```

Authentication:

```http
Authorization: Bearer YOUR_API_KEY
```

## Endpoints

### `GET /campaigns`

Returns:

- `campaign_id`
- `name`
- `start_date`
- `end_date`
- `is_active`
- `ugc_engineer`

Useful filters:

- `is_active`
- `platform`
- `start_date`
- `end_date`
- `limit`
- `cursor`

### `GET /campaigns/:campaignId`

Same minimal campaign object by default.

Optional includes:

- `segments`
- `handles`
- `summary`
- `metrics_history`

### `GET /creators`

Returns:

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

`is_active` is the creator-level active status. `campaigns[].handles[].is_active` is the handle-level active status.

Useful filters:

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

For creator text filters that may contain commas, such as `location`, `school`, `gender`, and `preferred_campaign_volume`, use repeated query parameters instead of comma-separated values. Example: `location=New%20York%2C%20NY&location=Chicago%2C%20IL`. The `interest` filter accepts comma-separated values.

### `GET /posts`

Returns:

- `post_id`
- `campaign_id`
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

Useful filters:

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

Sortable fields:

- `posted_at`
- `views`
- `likes`
- `comments`
- `saves`

### `GET /posts/:postId`

Returns the same post object for one post.

Single-post responses also include:

- `content_traits.hook`
- `content_traits.format_type`
- `content_traits.expression`
- `content_traits.location`

Optional includes:

- `campaign`
- `metrics_history`
- `comment_summary`

`include=comment_summary` adds a lightweight `comment_tracking` object for the post when Comment Tracking data is available.

### `GET /comments/summary`

Returns aggregate Comment Tracking metrics across matching tracked posts.

Useful filters:

- `campaign_id`
- `campaign_ids`
- `creator_id`
- `creator_ids`
- `platform`
- `start_date`
- `end_date`

Key fields:

- `analyzed_posts_count`
- `total_comments_count`
- `last_scraped_at`
- `sentiment_score_100`
- `on_topic_score_100`
- `brand_mention_count`
- raw count fields such as `positive_count`, `negative_count`, `on_topic_count`, `off_topic_count`, and `negative_feedback_count`
- `sentiment_breakdown`
- `relevance_breakdown`
- `type_breakdown`

`on_topic_score_100` counts both `on_topic` and `negative_feedback` comments as relevant conversation. The raw relevance breakdown keeps those buckets separate.

### `GET /comments`

Returns analyzed comment rows with safe public fields and minimal post context.

Useful filters:

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

Supported sort fields:

- `like_count`
- `posted_at`

Label values:

- `sentiment_label`: `positive`, `neutral`, `negative`
- `relevance_label`: `on_topic`, `off_topic`, `negative_feedback`
- `promotion_type`: `curiosity_driver`, `social_proof`, `word_of_mouth`, `feature_highlight`, `none`

Comment rows include `comment_id`, `post_id`, `campaign_id`, `text`, `username`, `display_name`, `posted_at`, `like_count`, `reply_count`, `region`, `language`, labels, and minimal `post` context.

### `GET /comments/top-posts`

Returns top tracked posts by views with the highest-liked analyzed comment for each post.

Useful filters:

- `campaign_id`
- `campaign_ids`
- `creator_id`
- `creator_ids`
- `platform`
- `start_date`
- `end_date`
- `limit`

### `GET /analytics/overview`

Returns:

- `total_posts`
- `total_views`
- `total_likes`
- `total_comments`
- `total_shares`
- `total_saves`
- `engagement_rate`
- `comment_rate`

Useful filters:

- `campaign_id`
- `campaign_ids`
- `creator_id`
- `creator_ids`
- `platform`
- `start_date`
- `end_date`

### `GET /analytics/posts/trending`

Returns the same trimmed post object as `GET /posts`, ordered by the requested metric.

Useful filters:

- all major post filters
- `limit`
- `cursor`
- `sort`
- `order`

## Time semantics

- Raw timestamps are returned as stored.
- Date filters and reporting semantics follow Pacific time (`America/Los_Angeles`).
- Always state the absolute date range used in your answer.

## Current limitations

The external API currently does not expose:

- creator detail endpoints
- creator progress reports
- campaign progress reports
- raw internal tables
- comment scraping or refresh operations

If the user asks for one of those, say the current API does not expose it.
