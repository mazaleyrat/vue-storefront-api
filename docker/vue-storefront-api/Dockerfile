FROM node:10-alpine

ENV VS_ENV prod

RUN mkdir /var/www/

WORKDIR /var/www

RUN apk add --no-cache curl git

<<<<<<< HEAD
COPY . /var/www/

RUN apk add --no-cache --virtual .build-deps ca-certificates wget git && yarn install --no-cache && apk del .build-deps
=======
COPY package.json ./
COPY yarn.lock ./

RUN apk add --no-cache --virtual .build-deps ca-certificates wget && \
    yarn install --no-cache && \
    apk del .build-deps
>>>>>>> upstream/master

COPY ./vue-storefront-api.sh /usr/local/bin/

CMD ["vue-storefront-api.sh"]
