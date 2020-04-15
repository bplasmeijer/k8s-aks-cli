$DOCKER_IMAGE = bplasmeijer/k8s-aks-cli
$GIT_BRANCH = $(shbuiell git rev-parse --abbrev-ref HEAD)

ifeq ($env:$(GIT_BRANCH), master)
	DOCKER_TAG = latest
else
	DOCKER_TAG = $(GIT_BRANCH)
endif

docker build `
      --build-arg VCS_REF="git rev-parse --short HEAD" `
      --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ" `
      -t $env:DOCKER_IMAGE:$env:(DOCKER_TAG) .