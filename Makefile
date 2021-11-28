
include .env

TAG=$(shell git rev-parse --short HEAD)

IMAGE_NAME="issam-airflow-demo"

registry-login:
	@-podman login registry.gitlab.com -u "$(GITLAB_USERNAME)" -p "$(GITLAB_TOKEN)"

build-image:
	@-podman build -t registry.gitlab.com/eli.mayost/$(IMAGE_NAME):$(TAG) -f k8s/Dockerfile .
	@-podman tag registry.gitlab.com/eli.mayost/$(IMAGE_NAME):$(TAG) registry.gitlab.com/eli.mayost/$(IMAGE_NAME):latest

push-image: registry-login
	@-podman push registry.gitlab.com/eli.mayost/$(IMAGE_NAME):$(TAG)
	@-podman push registry.gitlab.com/eli.mayost/$(IMAGE_NAME):latest

build-and-push: registry-login build-image push-image

start-cluster:
	minikube start --nodes 3 --cpus 4 --memory 16g --driver kvm2

stop-cluster:
	minikube stop

apply-secrets:
	kubectl apply -f k8s/git-sync-ssh-secret.yaml -n airflow-demo

deploy-airflow:
	helm upgrade --install airflow apache-airflow/airflow -n airflow-demo -f k8s/values.yaml --debug

undeploy-airflow:
	helm uninstall airflow -n airflow-demo --debug
