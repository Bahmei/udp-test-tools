#!/bin/bash
# File: vps_udp_server.sh

echo "Installing iperf3..."
sudo apt update -y && sudo apt install iperf3 -y

echo "Starting iperf3 server in UDP mode..."
nohup iperf3 -s -u > /dev/null 2>&1 &

echo "iperf3 UDP server is running on port 5201."
echo "To stop it manually: killall iperf3"
