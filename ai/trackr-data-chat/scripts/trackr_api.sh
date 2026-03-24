#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 \"/path?query=...\"" >&2
  exit 1
fi

if [[ -z "${TRACKR_API_KEY:-}" ]]; then
  echo "TRACKR_API_KEY is required" >&2
  exit 1
fi

BASE_URL="${TRACKR_API_BASE_URL:-https://app.ugctrackr.com/api/external/v1}"
PATH_AND_QUERY="$1"

curl -s "${BASE_URL}${PATH_AND_QUERY}" \
  -H "Authorization: Bearer ${TRACKR_API_KEY}" \
  -H "Accept: application/json"
