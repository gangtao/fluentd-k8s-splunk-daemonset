VERSION ?= 0.4
IMAGE_NAME ?= fluentd-k8s-splunk:${VERSION}
TARGET_NAME ?= naughtytao/fluentd-k8s-splunk:${VERSION}

docker: Dockerfile
	docker build --no-cache -t $(IMAGE_NAME) .
	docker tag $(IMAGE_NAME) $(TARGET_NAME)

push:
	docker push $(TARGET_NAME)

deploy:
	kubectl create -f fluentd-daemonset-splunk.yaml