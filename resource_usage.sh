#!/bin/bash

mem_used=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')
echo "Memory usage: $mem_used%"

cpu_usage=$(vmstat 1 2 | tail -n 1 | awk '{print $15}')
echo "CPU Usage: $cpu_usage%"

echo "Processes (CPU% MEM% COMMAND):"
ps -eo pid,user,pcpu,pmem,comm --sort=-pcpu
