# k8s-aks-cli client container

## Overview

This container provides the Azure CLI, Kubectl, Helm, and K9s client for use with Kubernetes.
- [azure cli](https://github.com/Azure/azure-cli)
- [kubectl](https://github.com/kubernetes/kubectl)
- [helm](https://github.com/helm/helm)
- [k9s](https://github.com/derailed/k9s)

### CI Build Status
![CI](https://github.com/bplasmeijer/k8s-aks-cli/workflows/CI/badge.svg)

### Container Details
[![](https://images.microbadger.com/badges/image/bplasmeijer/k8s-aks-cli.svg)](https://microbadger.com/images/bplasmeijer/k8s-aks-cli "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/bplasmeijer/k8s-aks-cli.svg)](https://microbadger.com/images/bplasmeijer/k8s-aks-cli "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/commit/bplasmeijer/k8s-aks-cli.svg)](https://microbadger.com/images/bplasmeijer/k8s-aks-cli "Get your own commit badge on microbadger.com")
[![](https://images.microbadger.com/badges/license/bplasmeijer/k8s-aks-cli.svg)](https://microbadger.com/images/bplasmeijer/k8s-aks-cli "Get your own license badge on microbadger.com")

# Supported tags and respective `Dockerfile` links
* `v1.16.7`,  `latest` [(latest/Dockerfile)](https://github.com/bplasmeijer/k8s-aks-cli/blob/v1.16.7/dockerfile)

## Run
```
docker run -it bplasmeijer/k8s-aks-cli:latest
```