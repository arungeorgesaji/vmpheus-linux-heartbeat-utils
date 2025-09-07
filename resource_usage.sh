#!/bin/bash

USERNAME="arun"
cores=$(nproc)
samples=5
interval=1

cpu_total=0

for i in $(seq 1 $samples); do
    usage=$(ps -u "$USERNAME" -o pcpu= | awk '{sum += $1} END {print sum}')
    cpu_total=$(awk -v total="$cpu_total" -v usage="$usage" 'BEGIN {print total + usage}')
    sleep $interval
done

cpu_avg=$(awk -v total="$cpu_total" -v samples="$samples" -v cores="$cores" 'BEGIN {printf "%.2f", total / samples / cores}')

mem_usage=$(ps -u "$USERNAME" -o pmem= | awk '{sum += $1} END {print sum}')

echo "Average CPU Usage for $USERNAME: ${cpu_avg}%"
echo "Memory Usage for $USERNAME: ${mem_usage}%"
