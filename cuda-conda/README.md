# Ubuntu w/ CUDA and Conda Docker Development Environment

**_WARNING: A default password has been set for the default user called `user`. The default password is `change-this-2026`. Use `passwd` along with this password to change the default password!_**

This Docker image contains the necessary PyTorch and TensorFlow tools pre-installed in Miniforge3 conda environments. See the Dockerfile for more info.

## CUDA Version Tags

- `12.6.3` = peytonsc/ubuntu-cuda-conda:12.6
- `12.8.1` = peytonsc/ubuntu-cuda-conda:12.8

## GPU Access Prerequisite: nvidia-container-toolkit

**_You must use the `--gpus all` argument to the `docker run` command to pass gpus access to the containter._**

## Bind/Mount a Directory

If you wish to have a directory shared between the host machine and the Docker container do the following when you run the image for the first time:

`docker run --gpus all --name <container_name> --hostname <hostname> --mount type=bind,source=<localdir>,target=<containerdir> -ti peytonsc/docker-cuda-conda:<cudaversion>`

## First Time Configuration/Installation

1. Run `docker pull peytonsc/docker-cuda-conda:<cudaversion>`
2. Run `docker run --gpus all --name <container_name> --hostname <hostname> -ti peytonsc/docker-cuda-conda:<cudaversion>`

## Re-Enter the shell via `docker exec` or `docker start`

- `docker start -ai <container_name>`
- `docker exec -u user -w /home/user -ti  <container_name> /bin/bash`
- `docker exec <container_name> <executable>`

## Conda

Conda is pre-installed via Miniforge3.

## Installing Other Packages:

The user password is `change-this-2026`. It is advised to reset this password as soon as possible upon creating the container.

Use `passwd` and `change-this-2026` to change the default password to a new password.

## Optional Setup:

Optionally, you can add the `--restart unless-stopped` to the `docker run` command to restart the docker container on docker startup.
