# Errors

The API returns structured JSON errors to help you diagnose failed requests quickly.

## Example

```json
{
  "error": {
    "code": "invalid_request",
    "message": "platform must be one of: tiktok, instagram"
  }
}
```

## Common status codes

- `400` invalid request parameters
- `401` missing, invalid, or disabled API key
- `404` resource not found
- `405` method not allowed
- `500` unexpected server error

## Common auth errors

- `missing_api_key`
- `invalid_api_key`
- `disabled_api_key`

## Cursor pagination notes

List endpoints return:

- `meta.count`
- `meta.limit`
- `meta.next_cursor`

If `next_cursor` is not `null`, send it back as the `cursor` query parameter on the next request.
