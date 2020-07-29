#!/usr/local/bin/zsh

echo 'Build it!'
./gradlew clean
./gradlew bootJar

echo 'Log In to AWS Docker Registry'
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin yourcontainerregistryhere

docker build -t yourproject-production-image-kotlin .
docker tag yourproject-production-image-kotlin:latest yourcontainerregistryhere/yourproject-production-image-kotlin:latest
docker push yourcontainerregistryhere/yourproject-production-image-kotlin:latest