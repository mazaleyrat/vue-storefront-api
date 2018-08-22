FROM node:8-alpine

ENV VS_ENV prod

RUN mkdir /var/www/

WORKDIR /var/www/

RUN apk add --no-cache imagemagick

COPY ./ /var/www/

RUN apk add --no-cache --virtual .build-deps ca-certificates wget git && yarn install --no-cache && apk del .build-deps

COPY ./docker/vue-storefront-api/vue-storefront-api.sh /usr/local/bin/

EXPOSE 8080

CMD ["vue-storefront-api.sh"]
