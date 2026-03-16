ARG BUILD_FROM
FROM ${BUILD_FROM}

# Upstream image switches to non-root appuser; we need root to install packages
USER root

# Install bash and jq for config parsing (upstream base is python:3.12-slim / Debian)
RUN apt-get update && apt-get install -y --no-install-recommends bash jq \
    && rm -rf /var/lib/apt/lists/*

# HA Supervisor mounts addon persistent data at /data;
# upstream app expects /app/data — symlink to bridge the two
RUN rm -rf /app/data && ln -s /data /app/data

COPY run.sh /run.sh
RUN chmod +x /run.sh

# Note: HA Supervisor manages container user/isolation;
# we stay as root so /data mounts are writable
CMD ["/run.sh"]
