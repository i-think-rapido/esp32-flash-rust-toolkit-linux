docker run -d --restart always --privileged -v /dev/bus/usb:/dev/bus/usb -v `pwd`:/work/prj --name esp esp
