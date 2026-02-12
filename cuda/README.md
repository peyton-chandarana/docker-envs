# Ubuntu CUDA Docker Development Environment

**_WARNING: A default password has been set for the default user called `user`. The default password is `change-this-2026`. Use `passwd` along with this password to change the default password!_**

## CUDA Version Tags

- `12.6.3` = peytonsc/ubuntu-cuda:12.6
- `12.8.1` = peytonsc/ubuntu-cuda:12.8

## GPU Access Prerequisite: nvidia-container-toolkit

**_You must use the `--gpus all` argument to the `docker run` command to pass gpus access to the containter._**

## Configuration/Installation

1. Run: `docker pull peytonsc/ubuntu-cuda:<cudaversion>`
2. Run: `docker run --gpus all --name <container_name> --hostname <hostname> -ti peytonsc/ubuntu-cuda:<cudaversion>`

## Enter the shell via `docker exec` or `docker start`

- `docker start -ai <container_name>`
- `docker exec -u user -w /home/user -ti  <container_name> /bin/zsh`
- `docker exec <container_name> <executable>`

Optionally, you can add the `--restart unless-stopped` to the `docker run` command to restart the docker container on docker startup.

## Installing Other Packages:

The user password is `change-this-2026`. It is advised to reset this password as soon as possible upon creating the container.

Use `passwd` and `change-this-2026` to change the default password to a new password.
