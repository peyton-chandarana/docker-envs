#!/bin/bash

# Create docker build environment
echo "### LOG --> INIT build environment..."
docker buildx create --name ubuntu_envs --use
echo "### LOG --> Created build environment..."

# Base
docker buildx build -f ./base/22.04/Dockerfile --no-cache \
                        --platform linux/amd64,linux/arm64 --push base \
                        --tag peytonsc/ubuntu-base:22.04
docker buildx build -f ./base/20.04/Dockerfile --no-cache \
                        --platform linux/amd64,linux/arm64 --push base \
                        --tag peytonsc/ubuntu-base:24.04
echo "### LOG --> Base images built..."
echo "### LOG --> Pushing images..."
# docker push peytonsc/ubuntu-base:22.04
# docker push peytonsc/ubuntu-base:24.04

# Miniforge3
docker buildx build -f ./conda/Dockerfile --no-cache \
                        --platform linux/amd64,linux/arm64 --push conda \
                        --tag peytonsc/ubuntu-conda:latest
echo "### LOG --> Conda images built..."
echo "### LOG --> Pushing images..."
# docker push peytonsc/ubuntu-conda:latest

# CUDA
echo "### LOG --> BUILDING CUDA IMAGES..."
docker buildx build -f ./cuda/12.6/Dockerfile --no-cache \
                        --platform=linux/amd64 --push cuda \
                        --tag peytonsc/ubuntu-cuda:12.6
docker buildx build -f ./cuda/12.8/Dockerfile --no-cache \
                        --platform=linux/amd64 --push cuda \
                        --tag peytonsc/ubuntu-cuda:12.8
echo "### LOG --> CUDA images built..."
echo "### LOG --> Pushing images..."
# docker push peytonsc/ubuntu-cuda:12.6
# docker push peytonsc/ubuntu-cuda:12.8

# CUDA Conda
echo "### LOG --> BUILDING GPU CONDA IMAGES..."
docker buildx build -f ./cuda-conda/12.6/Dockerfile --no-cache \
                        --platform=linux/amd64 --push cuda-conda \
                        --tag peytonsc/ubuntu-cuda-conda:12.6
docker buildx build -f ./cuda-conda/12.8/Dockerfile --no-cache \
                        --platform=linux/amd64 --push cuda-conda \
                        --tag peytonsc/ubuntu-cuda-conda:12.8
echo "### LOG --> CUDA-CONDA images built..."
echo "### LOG --> Pushing images..."
# docker push peytonsc/ubuntu-cuda-conda:12.4
# docker push peytonsc/ubuntu-cuda-conda:12.8
