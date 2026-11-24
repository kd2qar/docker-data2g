
IMAGE='kd2qar/data2g'

all: build

build:
	docker compose build

shell:
	docker compose run -P -i --rm  --entrypoint /bin/bash  data2g -c /bin/bash
up:
	docker compose up  

config:
	docker compose config


