default: docker_build

DOCKER_IMAGE ?= bskim45/helm-kubectl-jq
DOCKER_TAG ?= `git rev-parse --abbrev-ref HEAD`

docker_build:
	@docker build \
	  --build-arg VCS_REF=`git rev-parse --short HEAD` \
	  --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
	  -t $(DOCKER_IMAGE):$(DOCKER_TAG) .

docker_push:
	# Push to DockerHub
	docker push $(DOCKER_IMAGE):$(DOCKER_TAG)

.PHONY: latest
latest: HELM=$(shell ./version.sh helm)
latest: KUBECTL=$(shell ./version.sh kubectl)
latest:
	sed -i 's/KUBE_LATEST_VERSION="v[0-9]*.[0-9]*.[0-9]*"/KUBE_LATEST_VERSION="$(KUBECTL)"/' Dockerfile
	sed -i 's/HELM_VERSION="v[0-9]*.[0-9]*.[0-9]*"/HELM_VERSION="$(HELM)"/' Dockerfile