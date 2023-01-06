#!/bin/bash

#### Create and load the docker images
docker build -t web-home:1.0 ./web-pages-img/home/
docker build -t web-hpa:1.0 ./web-pages-img/hpa/
kind load docker-image web-home:1.0 --nodes kind-worker,kind-worker2
kind load docker-image web-hpa:1.0 --nodes kind-worker,kind-worker2

#### Metrics server with Helm
# kubectl config set-context --current --namespace=kube-system
# helm repo add metrics-server https://kubernetes-sigs.github.io/metrics-server
# helm upgrade --install metrics-server metrics-server/metrics-server --set hostNetwork.enable=true -f values.yaml
# kubectl config set-context --current --namespace=default

#### Install NGINX Ingress Controller
kubectl apply -f https://projectcontour.io/quickstart/contour.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=90s