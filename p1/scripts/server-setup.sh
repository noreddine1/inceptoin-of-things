#!/bin/bash

curl -sfL https:/get.k3s.io | sh -

# Wait until token exists
while [ ! -f /var/lib/rancher/k3s/server/node-token ]; do
    sleep 1
done

cp /var/lib/rancher/k3s/server/node-token /shared/k3s-token
chmod 644 /shared/k3s-token

sudo chmod 644 /etc/rancher/k3s/k3s.yaml