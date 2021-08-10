FROM alpine:3.12

ARG VCS_REF
ARG BUILD_DATE

# Metadata
LABEL org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.name="helm-kubectl-jq" \
    org.label-schema.url="https://hub.docker.com/r/mylesagray/helm-kubectl-jq/" \
    org.label-schema.vcs-url="https://github.com/mylesagray/docker-helm-kubectl-jq" \
    org.label-schema.build-date=$BUILD_DATE

# Note: Latest version of kubectl may be found at:
# https://github.com/kubernetes/kubernetes/releases
ENV KUBE_LATEST_VERSION="v1.22.0"
# Note: Latest version of helm may be found at:
# https://github.com/kubernetes/helm/releases
ENV HELM_VERSION="v3.6.3"

RUN apk add --no-cache ca-certificates bash git jq \
    && wget -q https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/arm64/kubectl -O /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl \
    && wget -q https://get.helm.sh/helm-${HELM_VERSION}-linux-arm64.tar.gz -O - | tar -xzO linux-arm64/helm > /usr/local/bin/helm \
    && chmod +x /usr/local/bin/helm

WORKDIR /config

CMD bash
