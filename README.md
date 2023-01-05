1. Criar cluster com as configurações do arquivo cluster-config.yaml
```kind create cluster --config=cluster-config.yaml```

2. Criar e instalar as imagens Docker, instalar o NGINX Ingress Controller e o Metrics Server no cluster via o arquivo requirements/configs.sh
```bash configs.sh```

3. Criar os componentes da pasta default

4. Criar os componentes da pasta hpa

5. Acessar *localhost* no navegador