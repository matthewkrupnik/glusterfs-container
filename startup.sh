#!/bin/bash
/usr/sbin/glusterd --log-level $GLUSTERD_LOG_LEVEL --log-file $GLUSTERD_LOG_FILE --no-daemon $GLUSTERD_OPTIONS
mount -t glusterfs $MOUNT_SRC $MOUNT_DST