#Installation des configurations cluster (securité)
kubectl create -f https://download.elastic.co/downloads/eck/2.9.0/crds.yaml
#Installation de l'opérateur ECK
kubectl apply -f https://download.elastic.co/downloads/eck/2.9.0/operator.yaml
#Déploiement de la plateforme ECK
kubectl apply -f https://raw.githubusercontent.com/elastic/cloud-on-k8s/2.9/config/recipes/elastic-agent/fleet-kubernetes-integration.yaml
#Déploiement NGINX + service
kubectl apply -f nginx-deployment.yaml
kubectl apply -f nginx-service.yaml


