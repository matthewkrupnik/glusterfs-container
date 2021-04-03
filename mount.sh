#!/bin/bash
sleep $SLEEP_SECONDS
mount -t glusterfs $MOUNT_SRC $MOUNT_DST
exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"