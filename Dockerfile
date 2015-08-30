FROM debian:jessie

RUN buildDeps='curl ca-certificates' \
        && set -x \
        && apt-get update && apt-get install -y $buildDeps --no-install-recommends

RUN CLOUD_SDK_REPO=cloud-sdk-jessie \
        && set -x \
        && echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee /etc/apt/sources.list.d/google-cloud-sdk.list \
        && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - \
        && apt-get update && apt-get install -y google-cloud-sdk --no-install-recommends

RUN buildDeps='curl ca-certificates' \
        && set -x \
        && rm -rf /var/lib/apt/lists/* \
        && apt-get purge -y --auto-remove $buildDeps

RUN ln -s /usr/bin/python2.7 /usr/local/bin/python

CMD [ "bash" ]
