FROM frolvlad/alpine-glibc

ENV OC_VERSION=v1.4.1 \
    OC_HASH=3f9807a

RUN apk add --no-cache curl git

RUN mkdir -p /openshift-origin-client-tools && \
    curl -L https://github.com/openshift/origin/releases/download/${OC_VERSION}/openshift-origin-client-tools-${OC_VERSION}-${OC_HASH}-linux-64bit.tar.gz \
      | tar xzC /openshift-origin-client-tools --strip-components=1 && \
    install /openshift-origin-client-tools/oc /usr/bin/oc && rm -rf openshift-origin-client-tools

COPY container-entrypoint /usr/sbin/container-entrypoint

RUN mkdir -m 770 -p /oc2/.kube
WORKDIR /oc2
ENV KUBECONFIG /oc2/.kube/config

ENTRYPOINT ["container-entrypoint"]
CMD ["YOLO"]
