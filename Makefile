MACHINE_NAME = aws-default
AWS_REGION = ap-northeast-1

build:
	docker-compose build
	docker-compose up -d cadvisor
	open http://$(shell docker-machine ip $(MACHINE_NAME)):8080/containers/docker

clean:
	docker-compose stop nimapp goapp
	docker-compose rm --force nimapp goapp

test-nim:
	docker-compose up -d nimapp
	docker-compose up nimapp-bench

test-go:
	docker-compose up -d goapp
	docker-compose up goapp-bench

setup:
	docker-machine create --driver amazonec2 --amazonec2-region $(AWS_REGION) $(MACHINE_NAME) || \
		docker-machine start $(MACHINE_NAME) || \
		true
	sleep 5
	eval "$(shell docker-machine env $(MACHINE_NAME) | tee ~/.dockerc)"

