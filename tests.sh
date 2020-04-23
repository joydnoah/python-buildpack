#!/usr/bin/env bash

if [[ -z "$STACK" ]]; then
    echo '$STACK must be set! (eg: `STACK=heroku-18 ./tests.sh`)'
    exit 1
fi

make "test-${STACK}"
