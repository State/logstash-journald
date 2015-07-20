#!/bin/bash

# Based on
# <https://github.com/docker-library/logstash/blob/master/docker-entrypoint.sh>
# from the `logstash` base layer, but runs Logstash as root, not the `logstash`
# user, to ensure access to the journal.

set -e

# Add logstash as command if needed
if [[ "$1" == -* ]]; then
  set -- logstash "$@"
fi

exec "$@"
