FROM --platform=linux/x86_64 ghcr.io/everest/everest-ci/build-kit-base:latest AS everest

ARG EVEREST_VERSION=2024.6.0
ENV EVEREST_VERSION=${EVEREST_VERSION}

WORKDIR ${EXT_MOUNT}/scripts
COPY install.sh .

WORKDIR ${WORKSPACE_PATH}

RUN git clone https://github.com/everest/everest-core.git /opt/everest-core \
  && cd /opt/everest-core \
  && git checkout ${EVEREST_VERSION}

RUN chmod +x ${EXT_MOUNT}/scripts/install.sh \
  && /entrypoint.sh run-script install

FROM python:3 AS tester

RUN python3 -m pip install --break-system-packages paho-mqtt

WORKDIR /root
