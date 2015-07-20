gem:
	docker build -f gem.Dockerfile -t logstash-journald-gem:latest .
	docker run -v "$(shell pwd)":/context --rm logstash-journald-gem:latest bash -c 'mv logstash-input-journald.gem /context/logstash-input-journald.gem'
