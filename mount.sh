#!/bin/bash
sleep 10
mount -t glusterfs $MOUNT_SRC $MOUNT_DST
exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"