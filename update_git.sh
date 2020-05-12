#!/bin/bash
if [ -z $GIT ]; then
    GIT="git"
fi
function update_git {
    GIT_URL=$(${GIT} remote get-url origin)
    if [[ $GIT_URL == *"dimlight"* ]]; then
        GIT_REPO_NAME="${GIT_URL##*/}"
        GIT_REPO_NAME="${GIT_REPO_NAME##*:}"
        echo "Updating $GIT url"
        NEW_GIT_REPO="ssh://git@racks.dimlight.net:8022/${GIT_REPO_NAME}"
        echo "from: $GIT_URL"
        echo "to: $NEW_GIT_REPO"
        ${GIT} remote set-url origin ${NEW_GIT_REPO}
    fi
}
if [[ -z $1 ]]; then
    update_git
else
    DIR=$1
    DIR=${DIR%"/.git"}
    echo $DIR
    pushd .
    cd $DIR
    pwd
    update_git
    popd
fi
