ARG BUILD_FROM
FROM ${BUILD_FROM}

# Install bash and jq for config parsing
# Try Alpine (apk) first, then Debian/Ubuntu (apt-get)
RUN if command -v apk >/dev/null 2>&1; then \
        apk add --no-cache bash jq; \
    elif command -v apt-get >/dev/null 2>&1; then \
        apt-get update && apt-get install -y --no-install-recommends bash jq \
        && rm -rf /var/lib/apt/lists/*; \
    else \
        echo "WARNING: Unknown package manager, bash/jq may be missing" >&2; \
    fi

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
