FROM debian:stable-slim

RUN apt-get update && apt-get install --no-install-recommends --yes glusterfs-server

ARG GLUSTERD_LOG_LEVEL
ARG GLUSTERD_LOG_FILE
ARG GLUSTERD_OPTIONS
ENV GLUSTERD_LOG_LEVEL="${GLUSTERD_LOG_LEVEL:-INFO}" GLUSTERD_LOG_FILE="${GLUSTERD_LOG_FILE:--}" GLUSTERD_OPTIONS="${GLUSTERD_OPTIONS:-}"

COPY ./startup.sh .

CMD ["/bin/sh" "-c" "startup.sh"]
