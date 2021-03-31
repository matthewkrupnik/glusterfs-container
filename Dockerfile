FROM debian:stable-slim

COPY ./startup.sh /

RUN apt-get update && apt-get install --no-install-recommends --yes glusterfs-server
RUN chmod +x /startup.sh

ARG GLUSTERD_LOG_LEVEL
ARG GLUSTERD_LOG_FILE
ARG GLUSTERD_OPTIONS
ENV GLUSTERD_LOG_LEVEL="${GLUSTERD_LOG_LEVEL:-INFO}" GLUSTERD_LOG_FILE="${GLUSTERD_LOG_FILE:--}" GLUSTERD_OPTIONS="${GLUSTERD_OPTIONS:-}"
ENV MOUNT_SRC="localhost:/gv0"
ENV MOUNT_DST=/mnt/gluster-vol


CMD ["/startup.sh"]
