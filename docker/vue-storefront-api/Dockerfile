FROM node:8-alpine

ENV VS_ENV prod

WORKDIR /var/www

RUN apk add --no-cache imagemagick

COPY . /var/www/

RUN apk add --no-cache --virtual .build-deps ca-certificates wget git && yarn install --no-cache && apk del .build-deps

COPY ./vue-storefront-api.sh /usr/local/bin/

CMD ["vue-storefront-api.sh"]
