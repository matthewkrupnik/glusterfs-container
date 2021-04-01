FROM debian:stable-slim

COPY ./mount.sh /

RUN apt-get update && apt-get install --no-install-recommends --yes glusterfs-server
RUN chmod +x /mount.sh

ARG GLUSTERD_LOG_LEVEL
ARG GLUSTERD_LOG_FILE
ARG GLUSTERD_OPTIONS
ENV GLUSTERD_LOG_LEVEL="${GLUSTERD_LOG_LEVEL:-INFO}" GLUSTERD_LOG_FILE="${GLUSTERD_LOG_FILE:--}" GLUSTERD_OPTIONS="${GLUSTERD_OPTIONS:-}"
ENV MOUNT_SRC=localhost:/gv0
ENV MOUNT_DST=/mnt/gluster-vol

CMD /usr/sbin/glusterd --log-level $GLUSTERD_LOG_LEVEL --log-file $GLUSTERD_LOG_FILE --no-daemon $GLUSTERD_OPTIONS
