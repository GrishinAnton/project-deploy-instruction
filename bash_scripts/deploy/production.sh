#!/usr/bin/env bash

DEPLOY_SECTION=$1
echo ${DEPLOY_SECTION}


if [[ -z "${DEPLOY_SECTION}" || ${DEPLOY_SECTION} = 'npm' ]]
then
    # Frontend / yarn / npm
    bash $(pwd)/bash_scripts/deploy/includes/npm.sh
fi

if [[ -z "${DEPLOY_SECTION}" || ${DEPLOY_SECTION} = 'permissions' ]]
then
    # Laravel permissions
    bash $(pwd)/bash_scripts/deploy/includes/permissions.sh
fi