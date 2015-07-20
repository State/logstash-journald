BASE=1.5.2
TAG=$(BASE)-$(shell git rev-parse --short head)

all: build

gem:
	docker build -f gem.Dockerfile -t logstash-journald-gem:latest .
	docker run -v "$(shell pwd)":/context --rm logstash-journald-gem:latest bash -c 'mv logstash-input-journald.gem /context/logstash-input-journald.gem'

build: gem
	docker build -f Dockerfile -t state/logstash-journald:$(TAG) .
