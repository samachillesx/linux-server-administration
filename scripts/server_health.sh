#!/bin/bash

echo "===== SERVER HEALTH CHECK ====="

echo ""
echo "Hostname:"
hostname

echo ""
echo "Uptime:"
uptime

echo ""
echo "Memory:"
free -h

echo ""
echo "Disk Usage:"
df -h

echo ""
echo "IP Address:"
hostname -I

echo ""
echo "Nginx Status:"
systemctl is-active nginx

echo ""
echo "===== CHECK COMPLETE ====="
