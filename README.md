![build](https://github.com/srsp/docker-ansible-azure/actions/workflows/docker-image.yml/badge.svg)
[![Docker Hub](https://img.shields.io/docker/v/srsp/ansible-azure?label=Docker%20Hub&logo=docker&logoColor=white)](https://hub.docker.com/r/srsp/ansible-azure)

# docker-ansible

Docker image with

* azure-cli
* ansible
* ansible-galaxy
* ansible-lint
* rsync
* openssh-client
* git

## Usage
```bash
docker pull srsp/ansible-azure
```

## Developers
This image uses `srsp/ansible` as base image and then just installs the latest `azure-cli`
package. I build new releases on a regular basis and publish them to docker hub. 

### Build 

```bash
docker build -f Dockerfile -t srsp/ansible-azure:latest .
```
