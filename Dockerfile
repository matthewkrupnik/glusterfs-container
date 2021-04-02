FROM debian:stable-slim

COPY ./mount.sh /
RUN chmod +x /mount.sh
RUN apt-get update && apt-get install --no-install-recommends --yes wget gnupg ca-certificates
RUN update-ca-certificates
RUN wget -O - https://download.gluster.org/pub/gluster/glusterfs/7/rsa.pub | apt-key add -
RUN export DEBID=$(grep 'VERSION_ID=' /etc/os-release | cut -d '=' -f 2 | tr -d '"')
RUN export DEBVER=$(grep 'VERSION=' /etc/os-release | grep -Eo '[a-z]+')
RUN export DEBARCH=$(dpkg --print-architecture)
RUN echo deb https://download.gluster.org/pub/gluster/glusterfs/LATEST/Debian/$(grep 'VERSION_ID=' /etc/os-release | cut -d '=' -f 2 | tr -d '"')/$(dpkg --print-architecture)/apt $(grep 'VERSION=' /etc/os-release | grep -Eo '[a-z]+') main > /etc/apt/sources.list.d/gluster.list
RUN apt-get update && apt-get install --no-install-recommends --yes glusterfs-server

ARG GLUSTERD_LOG_LEVEL
ARG GLUSTERD_LOG_FILE
ARG GLUSTERD_OPTIONS
ENV GLUSTERD_LOG_LEVEL="${GLUSTERD_LOG_LEVEL:-INFO}" GLUSTERD_LOG_FILE="${GLUSTERD_LOG_FILE:--}" GLUSTERD_OPTIONS="${GLUSTERD_OPTIONS:-}"
ENV MOUNT_SRC=localhost:/gv0
ENV MOUNT_DST=/mnt/gluster-vol

CMD /usr/sbin/glusterd --log-level $GLUSTERD_LOG_LEVEL --log-file $GLUSTERD_LOG_FILE --no-daemon $GLUSTERD_OPTIONS
