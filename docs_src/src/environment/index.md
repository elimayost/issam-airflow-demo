
# Seting up a local environment

## Things to install

 - [Docker](https://www.docker.com/) or [Podman](https://podman.io/) for RHEL
 - [Kubectl](https://kubernetes.io/docs/tasks/tools/) 
 - [Helm](https://helm.sh/)
 - Local Kubernetes cluster (using [Minikube](https://minikube.sigs.k8s.io/docs/))
 - Easy management of the cluster (using [k9s](https://k9scli.io/)) 
 - [Rclone](https://rclone.org/)
 - The Gihub repo [here](https://github.com/elimayost/issam-airflow-demo)

## Setup the demo

::: tip
I will show below the commands needed, but you can use the Makefile for less typing.

For example, to deploy airflow on the cluster:

```bash
make deploy-airflow 
```
:::

::: danger
Make sure that the current context for kubectl is "minikube"
so you do not deploy to a different cluster.
:::

::: danger
Apply the two secrets before install airflow as it depends on one of them
to pull the DAGs from the github repository.
:::

### Create a local k8s cluster

```bash
minikube start --cpus 4 --memory 8g
```

``` bash
kubectl config current-context
```
### Deploy secrets to the k8s cluster

```bash
kubectl apply -f k8s/git-sync-ssh-secret.yaml
```

### Instal Airflow on the k8s cluster

```bash
helm upgrade --install airflow apache-airflow/airflow -f k8s/values.yaml --debug
```

