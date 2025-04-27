#!/usr/bin/env bash
# shellcheck disable=SC2002

__main() {

  curl -X POST "$OPENAI_BASE_URL/images/generations" \
    -H "Authorization: Bearer $OPENAI_API_KEY" \
    -H "Content-type: application/json" \
    -d '{
        "model": "gpt-image-1",
        "prompt": "A childrens book drawing of a veterinarian using a stethoscope to listen to the heartbeat of a baby otter."
    }' >generations.json

  cat generations.json | jq -r '.data[0].b64_json' | base64 --decode >generations.png

}

__main
