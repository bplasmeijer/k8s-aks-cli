# Upgrade the helm client version here when the az cluster tiller version
# upgrades.
FROM lachlanevenson/k8s-helm:latest as helm

FROM lachlanevenson/k8s-kubectl:latest as kubectl

FROM mcr.microsoft.com/azure-cli

LABEL maintainer="Bart Plasmeijer <bart.plasmeijer@gmail.com>"

ARG VCS_REF
ARG BUILD_DATA

# Metadata
LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/bplasmeijer/k8s-aks-cli" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.docker.dockerfile="/Dockerfile"
      
ENV k9s=v0.19.2

ADD https://github.com/derailed/k9s/releases/download/${k9s}/k9s_Linux_x86_64.tar.gz /usr/src/sitecoredemo/k9s

RUN tar -xf k9s \
    && chmod +x k9s \
    && mv ./k9s /usr/local/bin/k9s

COPY --from=helm /usr/local/bin/helm /usr/local/bin/helm
COPY --from=kubectl /usr/local/bin/kubectl /usr/local/bin/kubectl


