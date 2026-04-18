#!/bin/bash

# --- Tamal's Server Health Monitor ---
# This script checks Disk, RAM, and Uptime

echo "=========================================="
echo "🏥 SYSTEM HEALTH REPORT - $(date)"
echo "=========================================="

# 1. Check Uptime (How long has it been running?)
echo "🕒 UPTIME:"
uptime
echo ""

# 2. Check Disk Space (Human-readable format)
echo "💾 DISK SPACE USAGE:"
df -h | grep '^/dev/' # Only show real hard drives, skip system stuff
echo ""

# 3. Check Memory/RAM (in Megabytes)
echo "🧠 RAM USAGE:"
free -m
echo ""

# 4. Top CPU-Hungry Processes (DevOps Troubleshooting)
echo "🔥 TOP 5 CPU-CONSUMING PROCESSES:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -6
echo ""

echo "=========================================="
echo "✅ Report Complete!"
