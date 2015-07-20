FROM logstash:1.5.2

# Copy the already built gem and install.
WORKDIR /plugins
COPY ./logstash-input-journald.gem ./
RUN /opt/logstash/bin/plugin install ./logstash-input-journald.gem

# Create a volume for storing state, set it as a default for the journald plugin
# to store the cursor.
VOLUME /var/lib/logstash-journald
ENV SINCEDB_DIR=/var/lib/logstash-journald

WORKDIR /
