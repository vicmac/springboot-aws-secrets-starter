# SpringBoot + AWS Secret Manager + Docker

A rough template for Dockerized Spring Boot apps using env vars from AWS Secret Manager

The interesting script is unfold.sh, which takes the AWS Secret Manager JSON set as an env var and parses it so every field is a separate env var in the Docker container
