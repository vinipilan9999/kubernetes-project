1. Criar cluster com as configurações do arquivo cluster-config.yaml
```kind create cluster --config=cluster-config.yaml```

2. Instalar o NGINX Ingress Controller no cluster via o arquivo ingress-controller-config.sh
```bash ingress-controller-config.sh```

3. Criar as imagens docker separadas dentro da pasta web-pages-img e em seguida adicioná-las no cluster
```docker build -t web-home:1.0 .```
```docker build -t web-hpa:1.0 .```
```kind load docker-image web-home:1.0```
```kind laod docker-image web-hpa:1.0```

4. Instalar o Metric Server
```kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml```
*Colocar ```--kubelet-insecure-tls=true``` e ```hostNetwork: true``` se necessário*

5. Criar os componentes da pasta default

6. Criar os componentes da pasta hpa

7. Acessar *localhost*