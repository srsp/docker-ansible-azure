![build](https://github.com/srsp/docker-ansible-azure/actions/workflows/docker-publish.yml/badge.svg)
[![Docker Hub](https://img.shields.io/docker/v/srsp/ansible-azure?label=Docker%20Hub&logo=docker&logoColor=white)](https://hub.docker.com/r/srsp/ansible-azure)

# docker-ansible-azure

Docker image with

* azure-cli
* ansible
* ansible-galaxy
* ansible-lint
* curl
* git
* openssh-client
* python3-hcloud
* rsync

## Usage
```bash
docker pull srsp/ansible-azure
```

## Developers
This image uses `srsp/ansible` as base image and installs the latest `azure-cli`
package. I build new releases on a regular basis and publish them to docker hub. 

### Build 

```bash
docker build -f Dockerfile -t srsp/ansible-azure:latest .
```
