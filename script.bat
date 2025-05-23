@echo off
setlocal

echo "Realizando login no Docker Hub..."
docker login || exit /b

echo "Criando as imagens..."

docker build -t wprotheus/projeto-backend:1.0 backend/. || exit /b
docker build -t wprotheus/projeto-database:1.0 database/. || exit /b

echo "Realizando o carregamento das imagens..."

docker push wprotheus/projeto-backend:1.0 || exit /b
docker push wprotheus/projeto-database:1.0 || exit /b

echo "Verificando acesso ao cluster Kubernetes..."
kubectl cluster-info || exit /b

echo "Criando serviços no cluster Kubernetes..."
kubectl apply -f ./services.yml || exit /b

echo "Criando os deployments..."
kubectl apply -f ./deployment.yml || exit /b

echo "Script finalizado com sucesso."

endlocal
pause
