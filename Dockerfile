FROM debian:8

RUN apt update && apt install -y curl && rm -rf /var/apt/lists/*

RUN curl -L https://github.com/openshift/origin/releases/download/v1.3.0/openshift-origin-client-tools-v1.3.0-3ab7af3d097b57f933eccef684a714f2368804e7-linux-64bit.tar.gz \
      | tar xz && \
    install /openshift-origin-client-tools-v1.3.0-3ab7af3d097b57f933eccef684a714f2368804e7-linux-64bit/oc \
      /usr/bin/oc && \
    rm -rf openshift*

RUN useradd -d /tmp app
USER app
