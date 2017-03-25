FROM frolvlad/alpine-glibc

ENV OC_VERSION=v1.4.1 \
    OC_HASH=3f9807a

RUN apk add --no-cache curl

RUN curl -sLo /usr/local/bin/ep https://github.com/kreuzwerker/envplate/releases/download/1.0.0-RC1/ep-linux && \ 
    chmod +x /usr/local/bin/ep

RUN mkdir -p /openshift-origin-client-tools && \
    curl -L https://github.com/openshift/origin/releases/download/${OC_VERSION}/openshift-origin-client-tools-${OC_VERSION}-${OC_HASH}-linux-64bit.tar.gz \
      | tar xzC /openshift-origin-client-tools --strip-components=1 && \
    install /openshift-origin-client-tools/oc /usr/bin/oc && rm -rf openshift-origin-client-tools

RUN mkdir -p /openshift

COPY .kubeconfig /openshift/.kubeconfig

COPY container-entrypoint /usr/sbin/container-entrypoint

WORKDIR /openshift

ENV KUBECONFIG .kubeconfig

ENTRYPOINT ["container-entrypoint"]
