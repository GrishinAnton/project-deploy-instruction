#!/bin/bash

curl -LO https://deployer.org/deployer.phar
cp deployer.phar /usr/local/bin/dep
chmod +x /usr/local/bin/dep

echo "Success!"