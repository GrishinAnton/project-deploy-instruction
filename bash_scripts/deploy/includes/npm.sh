#!/usr/bin/env bash

chmod -R 777 ./node_modules

echo 'yarn install'
yarn install

echo 'yarn prod'
yarn prod

echo 'chmod -R ug+rwx node_modules'
chmod -R ug+rwx node_modules



