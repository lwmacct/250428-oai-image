#!/usr/bin/env bash
# shellcheck disable=SC2002

__main() {
  curl -s -D >(grep -i x-request-id >&2) \
    -X POST "$OPENAI_BASE_URL/images/edits" \
    -H "Authorization: Bearer $OPENAI_API_KEY" \
    -F "model=gpt-image-1" \
    -F "image[]=@edits.raw.png" \
    -F 'prompt=Add the watermark maituan'

}

__main
