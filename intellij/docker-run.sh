#!/bin/bash -
IMAGE_NAME="$(jq --raw-output .name id.json)"
# IMAGE_VERSION="$(jq --raw-output .version id.json)"

XSOCK="/tmp/.X11-unix"
XAUTH="/tmp/.docker.xauth"

# DISPLAY=`echo $DISPLAY | sed 's/\(^[^:]*\).*/\1:0/'`
# xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | sudo xauth -f $XAUTH nmerge -
# sudo chmod 777 $XAUTH
# X11PORT=`echo $DISPLAY | sed 's/^[^:]*:\([^\.]\+\).*/\1/'`
# TCPPORT=`expr 6000 + $X11PORT`
# sudo ufw allow from 172.17.0.0/16 to any port $TCPPORT proto tcp 
#     # --net=host \

docker run -it --rm \
    --volume "${HOME}:/home/host" \
    --volume $XSOCK:$XSOCK \
    --volume $XAUTH:$XAUTH \
    --env XAUTHORITY=$XAUTH \
    --env DISPLAY=$DISPLAY \
    $@ \
    "${IMAGE_NAME}:latest"
