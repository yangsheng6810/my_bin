#!/bin/bash
if [ -z $GIT ]; then
    GIT="git"
fi
GIT_URL=$(${GIT} remote get-url origin)
if [[ $GIT_URL == *"dimlight.ml"* ]]; then
    GIT_REPO_NAME="${GIT_URL##*/}"
    echo "Updating $GIT url"
    NEW_GIT_REPO="ssh://git@racks.dimlight.net:8022/${GIT_REPO_NAME}"
    echo "from: $GIT_URL"
    echo "to: $NEW_GIT_REPO"
    ${GIT} remote set-url origin ${NEW_GIT_REPO}
fi
