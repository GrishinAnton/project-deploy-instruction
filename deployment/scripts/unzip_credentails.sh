#!/usr/bin/env bash
PATH_SSH=~/repo/deployment/ssh

openssl aes-256-cbc -K $encrypted_78547695f909_key -iv $encrypted_78547695f909_iv -in ${PATH_SSH}/credentails.zip.enc -out ${PATH_SSH}/credentails.zip -d
unzip -o ${PATH_SSH}/credentails.zip -d ${PATH_SSH}

chmod 600 ${PATH_SSH}/credentials/id_rsa.pub
