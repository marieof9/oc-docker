FROM debian:8

RUN apt update && apt install -y curl && rm -rf /var/apt/lists/*

RUN curl -L https://github.com/openshift/origin/releases/download/v1.1.4/openshift-origin-client-tools-v1.1.4-3941102-linux-64bit.tar.gz \
      | tar xz && \
    install /openshift-origin-client-tools-v1.1.4-3941102-linux-64bit/oc \
      /usr/bin/oc && \
    rm -rf openshift*

RUN useradd -d /tmp app
USER app
