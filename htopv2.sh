#!/bin/bash
awk'{ printf "%.2f" , $2/1024/1024 ; exit}' /proc/meminfo
awk '( $1 == "MemTotal:" ) { print $2/1048576 }' /proc/meminfo
