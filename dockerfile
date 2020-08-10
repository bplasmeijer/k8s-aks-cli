# Upgrade the helm client version here when the az cluster tiller version
# upgrades.
FROM alpine as helm

ENV HELM_LATEST_VERSION="v3.1.2"

RUN apk add --update ca-certificates \
 && apk add --update -t deps wget git openssl bash \
 && wget -q https://get.helm.sh/helm-${HELM_LATEST_VERSION}-linux-amd64.tar.gz \
 && tar -xf helm-${HELM_LATEST_VERSION}-linux-amd64.tar.gz \
 && mv linux-amd64/helm /usr/local/bin \
 && apk del --purge deps \
 && rm /var/cache/apk/* \
 && rm -f /helm-${HELM_LATEST_VERSION}-linux-amd64.tar.gz

FROM alpine as kubectl

ENV KUBE_LATEST_VERSION="v1.18.1"

RUN apk add --update ca-certificates \
 && apk add --update -t deps curl \
 && curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
 && chmod +x /usr/local/bin/kubectl \
 && apk del --purge deps \
 && rm /var/cache/apk/*

FROM alpine as k9s

ENV K9S_LATEST_VERSION=v0.19.2

RUN apk add --update ca-certificates \
 && apk add --update -t deps curl \
 && curl -L https://github.com/derailed/k9s/releases/download/${K9S_LATEST_VERSION}/k9s_Linux_x86_64.tar.gz -o /tmp/k9s.gz \
 && cd /tmp \
 && tar xf k9s.gz \ 
 && mv /tmp/k9s /usr/local/bin/k9s

FROM mcr.microsoft.com/azure-cli

LABEL maintainer="Bart Plasmeijer <bart.plasmeijer@gmail.com>"

ARG VCS_REF
ARG BUILD_DATA

# Metadata
LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/bplasmeijer/k8s-aks-cli" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.docker.dockerfile="/Dockerfile"
      
COPY --from=helm /usr/local/bin/helm /usr/local/bin/helm
COPY --from=kubectl /usr/local/bin/kubectl /usr/local/bin/kubectl
COPY --from=k9s /usr/local/bin/k9s /usr/local/bin/k9s

    
