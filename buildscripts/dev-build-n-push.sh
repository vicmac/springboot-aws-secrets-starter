#!/usr/local/bin/zsh

echo 'Build it!'
./gradlew clean
./gradlew bootJar

echo 'Log In to AWS Docker Registry'
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin yourcontainerregistryhere

docker build -t yourproject-development-image-kotlin .
docker tag yourproject-development-image-kotlin:latest yourcontainerregistryhere/yourproject-development-image-kotlin:latest
docker push yourcontainerregistryhere/yourproject-development-image-kotlin:latest