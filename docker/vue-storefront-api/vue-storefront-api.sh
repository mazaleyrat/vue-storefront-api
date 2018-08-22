#!/bin/sh
set -e

yarn install || exit $?
yarn setup || exit $?

if [ "$VS_ENV" = 'dev' ]; then
  yarn dev
else
  yarn start
fi
