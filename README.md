# GlusterFS container

Creating a container following this tutorial:
https://lenain.info/gluster-with-synology-docker/

## Configuration
Two environment variables must be set so that the container mounts the volume
| Variable| Description| Default Value  |
| --- | --- | --- |
| MOUNT_SRC | GlusterFS volume to be mounted | localhost:/gv0 |
| MOUNT_DST | Location the volume should be mounted to | /mnt/gluster-vol |
