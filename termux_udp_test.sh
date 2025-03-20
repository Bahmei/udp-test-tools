#!/data/data/com.termux/files/usr/bin/bash
# File: termux_udp_test.sh

clear
echo "========[ UDP Test to VPS ]========"

read -p "Enter VPS IP or domain: " SERVER_IP
PORT=5201
BANDWIDTH="5M"

echo ""
echo "Testing UDP to $SERVER_IP on port $PORT..."

RESULT=$(iperf3 -c $SERVER_IP -u -b $BANDWIDTH -p $PORT -t 5 2>&1)

echo ""
echo "==========[ Result ]=========="
echo "$RESULT"
echo "=============================="

if echo "$RESULT" | grep -q "Server Report"; then
    LOSS=$(echo "$RESULT" | grep -oP '\d+(\.\d+)?% packet loss')
    echo ""
    echo "Test succeeded."
    echo "Packet loss: $LOSS"

    if echo "$LOSS" | grep -q "0.0%"; then
        echo "UDP is open and working properly."
    else
        echo "UDP is open but some packets were lost."
    fi
else
    echo ""
    echo "UDP test failed. Port may be closed or UDP is blocked."
fi
