#!/bin/bash

# Check CPU usage, Memory usage, Disk usage, and Top 5 processes by memory usage

set -euo pipefail

os=$(uname -s)

print_header() { printf "\n=== %s ===\n" "$1"; }

if [[ "$os" == "Linux" ]]; then
  # CPU (use vmstat: 100 - idle)
  print_header "CPU usage"
  vmstat 1 2 | tail -1 | awk '{printf "Used: %.1f%%\n", 100-$15}'

  # Memory
  print_header "Memory usage"
  free -h | awk '/^Mem:/ {printf "Total: %s  Used: %s  Free: %s\n", $2, $3, $4}'

  # Disk (all mounted filesystems)
  print_header "Disk usage"
  df -hT | awk 'NR==1 || /^\/dev\// {printf "%-20s %-6s %-6s %-6s %-5s %s\n", $7, $3, $4, $5, $6, $1}'

  # Top 5 processes by memory
  print_header "Top 5 processes by memory"
  ps aux --sort=-%mem | awk 'NR==1 || NR<=6 {printf "%-8s %-6s %-5s %-6s %s\n", $1, $2, $4, $3, $11}'
else
  # macOS (Darwin)
  print_header "CPU usage"
  top -l 1 | awk -F'[:,% ]+' '/CPU usage/ {printf "Used: %.1f%%\n", $3+$6}'

  print_header "Memory usage"
  # Example: "PhysMem: 12G used, 4G free."
  top -l 1 | awk -F'[:, ]+' '/PhysMem/ {printf "Used: %s  Free: %s\n", $3, $5}'

  print_header "Disk usage"
  df -h | awk 'NR==1 || /^\/dev\// {printf "%-20s %-6s %-6s %-6s %-6s %s\n", $9, $3, $4, $5, $2, $1}'

  print_header "Top 5 processes by memory"
  ps aux | sort -rk 4 | awk 'NR==1 || NR<=6 {printf "%-8s %-6s %-5s %-6s %s\n", $1, $2, $4, $3, $11}'
fi
