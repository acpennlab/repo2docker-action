# https://quay.io/repository/jupyterhub/repo2docker?tab=tags
FROM quay.io/jupyterhub/repo2docker:2023.06.0-78.ga20dd1c@sha256:7ffa7a5d29942403d10524f933e7742d6d5f0835a82489e1978ffcf85df306e5

RUN apk add --no-cache curl build-base python3 python3-dev py3-pip

RUN python3 -m pip install --upgrade wheel setuptools

# https://stackoverflow.com/a/41651363/1695486
RUN apk add --no-cache curl curl-dev
COPY create_docker_image.sh /create_docker_image.sh
COPY binder_cache.py /binder_cache.py
COPY trigger_binder.sh /trigger_binder.sh

ENTRYPOINT ["/bin/bash", "/create_docker_image.sh"]

