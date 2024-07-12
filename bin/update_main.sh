#!/usr/bin/env bash

CURRENT_BRANCH=`git rev-parse --abbrev-ref HEAD`
DEFAULT_BRANCH=`git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@'`

if [[ "$CURRENT_BRANCH" == "$DEFAULT_BRANCH" ]]; then
        exec git pull
else
        exec bash -c "git checkout "$DEFAULT_BRANCH" && git pull"
fi;

