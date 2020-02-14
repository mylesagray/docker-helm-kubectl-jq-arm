# helm-kubectl-jq Docker image

[![](https://images.microbadger.com/badges/image/bskim45/helm-kubectl-jq.svg)](https://microbadger.com/images/bskim45/helm-kubectl-jq "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/bskim45/helm-kubectl-jq.svg)](https://microbadger.com/images/bskim45/helm-kubectl-jq "Get your own version badge on microbadger.com")
[![Build Status](https://travis-ci.com/bskim45/docker-helm-kubectl-jq.svg?branch=master)](https://travis-ci.com/bskim45/docker-helm-kubectl-jq.svg)
[![Docker Stars](https://img.shields.io/docker/stars/bskim45/helm-kubectl-jq.svg?style=flat)](https://hub.docker.com/r/bskim45/helm-kubectl-jq/)
[![Docker Pulls](https://img.shields.io/docker/pulls/bskim45/helm-kubectl-jq.svg)]()

Supported tags and release links

* [3.1.0](https://github.com/bskim45/docker-helm-kubectl-jq/releases/tag/3.0.2) - helm v3.1.0, kubectl v1.17.3, alpine 3.11, jq 1.6
* [3.0.3](https://github.com/bskim45/docker-helm-kubectl-jq/releases/tag/3.0.2) - helm v3.0.3, kubectl v1.17.2, alpine 3.11, jq 1.6
* [3.0.2](https://github.com/bskim45/docker-helm-kubectl-jq/releases/tag/3.0.2) - helm v3.0.2, kubectl v1.17.0, alpine 3.10, jq 1.6
* [3.0.1](https://github.com/bskim45/docker-helm-kubectl-jq/releases/tag/3.0.1) - helm v3.0.1, kubectl v1.16.3, alpine 3.10, jq 1.6
* [3.0.0](https://github.com/bskim45/docker-helm-kubectl-jq/releases/tag/3.0.0) - helm v3.0.0, kubectl v1.16.3, alpine 3.10, jq 1.6
* [2.16.1](https://github.com/bskim45/docker-helm-kubectl-jq/releases/tag/2.16.1) - helm v2.16.1, kubectl v1.16.2, alpine 3.10, jq 1.6
* [2.16.0](https://github.com/bskim45/docker-helm-kubectl-jq/releases/tag/2.16.0) - helm v2.16.0, kubectl v1.16.2, alpine 3.10, jq 1.6
* [2.15.2](https://github.com/bskim45/docker-helm-kubectl-jq/releases/tag/2.15.2) - helm v2.15.2, kubectl v1.16.2, alpine 3.10, jq 1.6
* [2.15.1](https://github.com/bskim45/docker-helm-kubectl-jq/releases/tag/2.15.1) - helm v2.15.1, kubectl v1.16.2, alpine 3.10, jq 1.6
* [2.15.0](https://github.com/bskim45/docker-helm-kubectl-jq/releases/tag/2.15.0) - helm v2.15.0, kubectl v1.16.2, alpine 3.10, jq 1.6
* [2.14.3](https://github.com/bskim45/docker-helm-kubectl-jq/releases/tag/2.14.3) - helm v2.14.3, kubectl v1.15.2, alpine 3.10, jq 1.6
* [2.14.2](https://github.com/bskim45/docker-helm-kubectl-jq/releases/tag/2.14.2) - helm v2.14.2, kubectl v1.15.2, alpine 3.10, jq 1.6
* [2.14.1](https://github.com/bskim45/docker-helm-kubectl-jq/releases/tag/2.14.1) - helm v2.14.1, kubectl v1.14.4, alpine 3.9, jq 1.6
* [2.14.0](https://github.com/bskim45/docker-helm-kubectl-jq/releases/tag/2.14.0) - helm v2.14.0, kubectl v1.14.1, alpine 3.9, jq 1.6
* [2.13.1](https://github.com/bskim45/docker-helm-kubectl-jq/releases/tag/2.13.1) - helm v2.13.1, kubectl v1.13.4, alpine 3.9, jq 1.6
* [2.13.0](https://github.com/bskim45/docker-helm-kubectl-jq/releases/tag/2.13.0) - helm v2.13.0, kubectl v1.13.4, alpine 3.9, jq 1.6
* [2.12.3](https://github.com/bskim45/docker-helm-kubectl-jq/releases/tag/2.12.3) - helm v2.12.3, kubectl v1.13.2, alpine 3.8, jq 1.6
* [2.12.2](https://github.com/bskim45/docker-helm-kubectl-jq/releases/tag/2.12.2) - helm v2.12.2, kubectl v1.13.2, alpine 3.8, jq 1.6
* [2.12.1](https://github.com/bskim45/docker-helm-kubectl-jq/releases/tag/2.12.1) - helm v2.12.1, kubectl v1.13.1, alpine 3.8, jq 1.6

## Overview

This lightweight alpine docker image provides kubectl and helm binaries for working with a Kubernetes cluster.  A local configured kubectl is a prerequisite to use helm per [helm documentation](https://github.com/kubernetes/helm/blob/master/docs/quickstart.md).  This image is useful for general helm administration such as deploying helm charts and managing releases. It is also perfect for any automated deployment pipeline needing to use helm which supports docker images such as [Concourse CI](https://concourse.ci), [Jenkins on Kubernetes](https://kubeapps.com/charts/stable/jenkins), [Travis CI](https://docs.travis-ci.com/user/docker/), and [Circle CI](https://circleci.com/integrations/docker/).  Having bash installed allows for better support for troubleshooting by being able to exec / terminal in and run desired shell scripts.  Git installed allows installation of [helm plugins](https://github.com/kubernetes/helm/blob/master/docs/plugins.md).

If it is desired to only use kubectl and have kubectl as the entry command (versus this image as bash entry command), I recommend checking out this image instead:
[lachlanevenson/kubectl](https://hub.docker.com/r/lachlanevenson/k8s-kubectl/)

## Run

Example to just run helm on entry:
`docker run --rm bskim45/helm-kubectl-jq helm`
By default kubectl will try to use /root/.kube/config file for connection to the kubernetes cluster, but does not exist by default in the image.

Example for use with personal administration or troubleshooting with volume mount for kubeconfig files:
`docker run -it -v ~/.kube:/root/.kube bskim45/helm-kubectl-jq`

## Build

For doing a manual local build of the image:
`make docker_build`

This image is now fully automated via travisci.org.
For reference this .travis.yml file can be validated via:
`docker run --rm -it -v yourclonedreporoot:/project caktux/travis-cli lint ./.travis.yml`
