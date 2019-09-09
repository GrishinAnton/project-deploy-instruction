#!/usr/bin/env bash

echo 'chmod -R 755 ./'
chmod -R 755 ./;
echo 'find ./ -type f -exec chmod 644 {} \;'
find ./ -type f -print0 | sudo xargs -0 chmod 644
