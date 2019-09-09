#!/bin/bash

# Please, run this script from root of project

mkdir deployment/decrypted_credentials
openssl aes-256-cbc -K $encrypted_78547695f909_key -iv $encrypted_78547695f909_iv -in deployment/credentials/id_rsa_ghd.zip.enc -out deployment/decrypted_credentials/id_rsa_ghd.zip -d
unzip deployment/decrypted_credentials/id_rsa_ghd.zip -d deployment/decrypted_credentials