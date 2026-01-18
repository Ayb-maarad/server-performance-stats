#!/bin/bash


cpu=$(top -bn 1 | grep %Cpu | awk '{print 100 - $8}')

echo "total cpu usage $cpu"

mem=$(top -bn 1 |  awk '/^MiB Mem/ {print (100*$8)/$4}')

free=$(top -bn 1 |  awk '/^MiB Mem/ {print (100* $6)/$4}')

disk_use=$(df -h | awk '/^\/dev\/sda2/ {print $5}')

disk_free=$(df -h | awk '/^\/dev\/sda2/ {print 100 - $5}')


echo "total memory usage is $mem"
echo "free memory is $free"
echo "used disk is $disk_use"
echo "free disk is $disk_free%"
printf "\n\n"
echo "top 5 processes by cpu usage: "
printf "\n\n"

ps aux --sort=-%cpu | head -n 5
printf "\n\n"
echo "top 5 processes bt memory usage: "
printf "\n\n"


ps aux --sort=-%mem | head -n 5
