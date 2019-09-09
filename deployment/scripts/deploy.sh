#!/usr/bin/env bash

PATH_CREDENTAILS=~/repo/deployment/scripts
PATH_SSH=deployment/ssh/id_rsa

chmod +x ${PATH_CREDENTAILS}/unzip_credentails.sh && ${PATH_CREDENTAILS}/unzip_credentails.sh

echo "Deploy run!";

# if [[ "${CIRCLE_BRANCH}" = 'master' ]] 
# then
#   APP_ENV=production
#   DEPLOY_PATH=/var/www/stage-prod.iflorist.ru
#   echo "Deploy to production is disabled!"
#   exit 0
#   ssh -o "StrictHostKeyChecking=no" -i ${PATH_SSH} "${DEPLOY_USER}@${DEPLOY_HOST}" "
#     cd ${DEPLOY_PATH} && \
#     sudo -S git pull origin master && \
#     chmod +x ./deploy.sh && \
#     ./deploy.sh
#   "
#   echo "Success!!!"
# fi

# if [[ "$CIRCLE_BRANCH" = 'develop' ]] 
# then
#   APP_ENV=staging
#   DEPLOY_PATH=/var/www/stage-alpha.iflorist.ru
#   echo "Deploy to staging"
#   ssh -o "StrictHostKeyChecking=no" -i ${PATH_SSH} "${DEPLOY_USER}@${DEPLOY_HOST}" "
#     cd ${DEPLOY_PATH} && \
#     sudo -S git pull origin develop && \
#     chmod +x ./deploy.sh && \
#     ./deploy.sh
#   "
#   echo "Success!!!"
# fi
