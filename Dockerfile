FROM logstash:1.5.2

# Copy the already built gem and install.
WORKDIR /plugins
COPY ./logstash-input-journald.gem ./
RUN /opt/logstash/bin/plugin install ./logstash-input-journald.gem

WORKDIR /
