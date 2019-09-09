#!/usr/bin/env bash

############################################
#
#  Run script on local / production server
#
# ------------------------------------------
#  Examples
# ------------------------------------------
#
#   sudo bash ./bash_scripts.sh
#
# ------------------------------------------
#  Manualy changes
# ------------------------------------------
#
#   sudo bash ./bash_scripts.sh -env=local
#   sudo bash ./bash_scripts.sh -e=local
#
############################################

DEPLOY_SECTION=$1

# Get from .env
DEPLOY_ENV=$(grep APP_ENV .env | cut -d '=' -f2)

# Or get from bash parameters
for i in "$@"
do
case $i in
    -e=*|--env=*)
    DEPLOY_ENV="${i#*=}"
esac
done

DEPLOY_SCRIPT_PATH=./bash_scripts/deploy

DEPLOY_SCRIPT=${DEPLOY_SCRIPT_PATH}/${DEPLOY_ENV}.sh

bash ${DEPLOY_SCRIPT} ${DEPLOY_SECTION}