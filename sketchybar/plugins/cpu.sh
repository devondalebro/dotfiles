#!/bin/bash
# Gets simple CPU load
CORE_COUNT=$(sysctl -n machdep.cpu.core_count)
CPU_INFO=$(ps -A -o %cpu | awk -v cpu_count=$CORE_COUNT '{s+=$1} END {print s/cpu_count}')
CPU_PERCENT=$(printf "%.0f" "$CPU_INFO")

sketchybar --set $NAME label="$CPU_PERCENT%"
