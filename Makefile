BASE=1.5.2
TAG=$(BASE)-$(shell git rev-parse --short head)

all: tags

gem:
	docker build -f gem.Dockerfile -t logstash-journald-gem:latest .
	docker run -v "$(shell pwd)":/context --rm logstash-journald-gem:latest bash -c 'mv logstash-input-journald.gem /context/logstash-input-journald.gem'

build: gem
	docker build -f Dockerfile -t state/logstash-journald:$(TAG) .

tags: build
	docker tag -f state/logstash-journald:$(TAG) state/logstash-journald:$(BASE)

push: tags
	docker push state/logstash-journald:$(TAG)
	docker push state/logstash-journald:$(BASE)
