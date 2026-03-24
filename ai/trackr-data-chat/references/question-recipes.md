# Question Recipes

Use these recipes to translate business questions into API calls.

## 1. "Which campaigns are active?"

Call:

```text
GET /campaigns?is_active=true
```

Return:

- campaign names
- campaign IDs when useful
- start/end dates

## 2. "What happened over a date range?"

Call:

```text
GET /analytics/overview?start_date=YYYY-MM-DD&end_date=YYYY-MM-DD
```

Optionally add:

- `platform=tiktok`
- `campaign_id=...`
- `creator_id=...`

Return:

- totals
- engagement rate
- comment rate

## 3. "What were the top posts?"

Call:

```text
GET /analytics/posts/trending?sort=views&order=desc&limit=N
```

Optionally add:

- `start_date`
- `end_date`
- `platform`
- `campaign_id`

Return:

- rank
- title
- username
- posted date
- views and engagement metrics

## 4. "List raw posts for review"

Call:

```text
GET /posts?sort=posted_at&order=desc&limit=N
```

Paginate with `meta.next_cursor` if needed.

## 5. "Compare subsets"

Run multiple API calls with different filters, then compare:

- TikTok vs Instagram
- one campaign vs another
- one date range vs another

Always label which filters belong to each comparison group.

## 6. Unsupported questions

If the user asks for:

- time series charts
- progress tracking
- internal-only fields
- write operations

Explain that the current public API does not expose that capability yet.
