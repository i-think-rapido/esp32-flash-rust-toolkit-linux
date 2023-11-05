device=/dev/serial/by-path/`ls /dev/serial/ 1>/dev/null 2>&1 && dir /dev/serial/by-path -1t || echo no-device | head -1`
device=`realpath $device`
docker exec -it esp /work/main.sh $device $@

