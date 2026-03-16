ARG BUILD_FROM
FROM ${BUILD_FROM}

# The upstream image already has everything installed.
# We just need to copy in our run script that reads HA add-on options.
COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
