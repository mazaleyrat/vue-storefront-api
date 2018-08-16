#!/bin/sh
set -e

yarn install || exit $?

yarn restore
yarn migrate
git clone https://github.com/magento/magento2-sample-data.git var/magento2-sample-data

if [ "$VS_ENV" = 'dev' ]; then
  yarn dev
else
  yarn start
fi
