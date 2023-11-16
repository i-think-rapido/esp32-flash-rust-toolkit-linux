docker ps | grep esp 1>/dev/null && `dirname $0`/kill-docker.sh
docker run -d --restart always --privileged -v /dev/bus/usb:/dev/bus/usb -v `pwd`:/work/prj --name esp esp
