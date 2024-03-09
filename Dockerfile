FROM quay.io/jupyterhub/repo2docker:2022.10.0-89.g49162fc@sha256:5a642dfa4769f656efb6d3349f7ab94a4490d155773987df0aebe19a9a982efb

RUN apk add --no-cache curl build-base python3 python3-dev py3-pip

RUN python3 -m pip install --upgrade wheel setuptools

# https://stackoverflow.com/a/41651363/1695486
RUN apk add --no-cache curl curl-dev
COPY create_docker_image.sh /create_docker_image.sh
COPY binder_cache.py /binder_cache.py
COPY trigger_binder.sh /trigger_binder.sh

ENTRYPOINT ["/bin/bash", "/create_docker_image.sh"]

