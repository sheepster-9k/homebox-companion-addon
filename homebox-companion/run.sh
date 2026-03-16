#!/usr/bin/env bash
set -euo pipefail

# Read add-on options from /data/options.json (populated by HA Supervisor)
CONFIG_PATH="/data/options.json"

if [ -f "$CONFIG_PATH" ]; then
    if ! jq empty "$CONFIG_PATH" 2>/dev/null; then
        echo "ERROR: $CONFIG_PATH is not valid JSON" >&2
        exit 1
    fi
    export HBC_HOMEBOX_URL="$(jq -r '.homebox_url // ""' "$CONFIG_PATH")"
    export HBC_LLM_API_KEY="$(jq -r '.llm_api_key // "local"' "$CONFIG_PATH")"
    export HBC_LLM_API_BASE="$(jq -r '.llm_api_base // ""' "$CONFIG_PATH")"
    export HBC_LLM_MODEL="$(jq -r '.llm_model // "qwen3-vl:30b"' "$CONFIG_PATH")"
    export HBC_LLM_ALLOW_UNSAFE_MODELS="$(jq -r '.llm_allow_unsafe_models // true' "$CONFIG_PATH")"
    export HBC_IMAGE_QUALITY="$(jq -r '.image_quality // "medium"' "$CONFIG_PATH")"
    export HBC_CORS_ORIGINS="$(jq -r '.cors_origins // ""' "$CONFIG_PATH")"
fi

# Validate URL scheme if provided (prevent file:// or other dangerous schemes)
if [ -n "${HBC_HOMEBOX_URL:-}" ]; then
    case "$HBC_HOMEBOX_URL" in
        http://*|https://*)
            ;;
        *)
            echo "ERROR: homebox_url must use http:// or https:// scheme" >&2
            exit 1
            ;;
    esac
fi

# Bind to the ingress port
export HBC_SERVER_HOST="0.0.0.0"
export HBC_SERVER_PORT="8000"

# Disable update check in add-on context
export HBC_DISABLE_UPDATE_CHECK="true"

echo "Starting Homebox Companion..."
echo "  Homebox URL: ${HBC_HOMEBOX_URL:-not set}"
echo "  LLM Model:   ${HBC_LLM_MODEL}"
echo "  LLM Base:    ${HBC_LLM_API_BASE:-default}"
echo "  API Key:     [configured]"

# Start the application (upstream entrypoint)
exec python -m homebox_companion.main
