#!/bin/bash

#### Create and load the docker images
docker build -t web-home:1.0 ./web-pages-img/home/
docker build -t web-hpa:1.0 ./web-pages-img/hpa/
kind load docker-image web-home:1.0
kind load docker-image web-hpa:1.0

#### Install Metrics Server for HPA
# kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
# wget https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
kubectl apply -f components.yaml

#### Install NGINX Ingress Controller
kubectl apply -f https://projectcontour.io/quickstart/contour.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=90s