**For a more stable cluster:**

Start Minikube with specific memory and CPU resources:

```bash
minikube start --memory 10000 --cpus 4
```

**Installation of the ECK + NGINX platform:**

1. Run `script.sh`.

**To check the status of ECK (Elasticsearch, Kibana, and agents pods):**

```bash
kubectl get elastic
```

When everything is "green," proceed with the following commands:

**To access the NGINX homepage (opening a load balancer):**

```bash
minikube tunnel
```

**To get the connection address for NGINX:**

```bash
kubectl get svc nginx-service
```

**To access Kibana, you need to:**

Expose its port outside the cluster:

```bash
kubectl port-forward service/kibana-kb-http 5601
```

**To get the password to log in to Kibana with the "elastic" username:**

```bash
kubectl get secret elasticsearch-es-elastic-user -o=jsonpath='{.data.elastic}' | base64 --decode; echo
```

**Application address:** [https://localhost:5601](https://localhost:5601)
**Login:** elastic

Follow these steps in order to set up your environment and access Kibana via Minikube.