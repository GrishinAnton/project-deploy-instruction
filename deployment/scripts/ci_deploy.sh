#!/bin/bash

# Please, run this script from root of project

# 1. Install deployer

deployment/scripts/install_deployer.sh

# 2. Decode credentials

deployment/scripts/decrypt_credentials.sh

# 3. Move decoded private key to ssh directory and configure ssh

mkdir ~/.ssh
cp deployment/decrypted_credentials/id_rsa_ghd.private ~/.ssh/id_rsa_ghd.private
chmod 400 ~/.ssh/id_rsa_ghd.private
touch ~/.ssh/config
echo "Host iflorist.ru" >> ~/.ssh/config
echo "    IdentityFile ~/.ssh/id_rsa_ghd.private" >> ~/.ssh/config
echo "    ServerAliveInterval 120" >> ~/.ssh/config
echo "    ServerAliveCountMax 60" >> ~/.ssh/config



# 4. Define environment by branch

DEPLOY_ENV=""

case "$CIRCLE_BRANCH" in
    develop)
        DEPLOY_ENV="develop"
        ;;
    *release/*)
        DEPLOY_ENV="pre_production"
        ;;
    master)
        DEPLOY_ENV="production"
        ;;
esac

# 5. Run deployer

if [ -z "$DEPLOY_ENV" ]
then
    echo "Deploy environment if not defined!"
else
    dep deploy ${DEPLOY_ENV}
fi