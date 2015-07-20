FROM jruby:1.7.21-jdk

WORKDIR /gem
RUN git clone https://github.com/EqualMedia/logstash-input-journald.git . \
    && git reset --hard 5277d7aea08fd19a137f1a648a561ea36cac0baa \
    && jgem build logstash-input-journald.gemspec \
    && mv logstash-input-journald-*.gem logstash-input-journald.gem
