ARG BUILD_FROM
FROM ${BUILD_FROM}

# Install jq for config parsing (bash is typically present in Python images)
RUN pip install --no-cache-dir 2>/dev/null || true && \
    (apk add --no-cache jq 2>/dev/null || apt-get update && apt-get install -y --no-install-recommends jq && rm -rf /var/lib/apt/lists/* || true)

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
