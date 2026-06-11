#!/bin/bash

SERVER_IP="192.168.56.110"
NODE_IP="192.168.56.111"

while [ ! -f /shared/k3s-token ]; do
    echo "Waiting for K3s token..."
    sleep 2
done

TOKEN=$(cat /shared/k3s-token)

curl -sfL https://get.k3s.io | \
  K3S_URL="https://192.168.56.110:6443" \
  K3S_TOKEN="$TOKEN" \
  sh -

sudo chmod 644 /etc/rancher/k3s/k3s.yaml
