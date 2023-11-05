#!/bin/bash
source /root/export-esp.sh
cd /work/prj
cargo espflash flash -p $@

