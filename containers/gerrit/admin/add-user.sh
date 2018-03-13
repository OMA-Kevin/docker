#!/bin/bash
set -e
#addGerritUser.sh <Gerrit canonicalWebUrl> <admin http uid> <admin http password> <public ssh key path>
#GERRIT_WEBURL=${GERRIT_WEBURL:-$1}
#HTTP_UID=${GERRIT_ADMIN_UID:-$2}
#HTTP_PWD=${GERRIT_ADMIN_PWD:-$3}
#SSH_KEY_PATH=${SSH_KEY_PATH:-$4}
echo "NEED TO BE USER"
USER="$LOGNAME"
PW=$PW

GERRIT_WEBURL="http://gerrit"
HTTP_UID=$USER
HTTP_PWD=$PW
SSH_KEY_PATH="/home/$USER/.ssh/id_rsa"

#Remove appended '/' if existed.
GERRIT_WEBURL=${GERRIT_WEBURL%/}

# Do first time login.
RESPONSE=$(curl -X POST -d "username=${HTTP_UID}" -d "password=${HTTP_PWD}" ${GERRIT_WEBURL}/login 2>/dev/null)
[ -z "${RESPONSE}" ] || { echo "${RESPONSE}" ; exit 1; }

# Add ssh-key
cat "${SSH_KEY_PATH}.pub" | curl --data @- --user "${HTTP_UID}:${HTTP_PWD}"  ${GERRIT_WEBURL}/a/accounts/self/sshkeys

