FROM node:8-alpine

ENV VS_ENV prod

WORKDIR /var/www/

RUN apk add --no-cache imagemagick

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./
RUN apk add --no-cache --virtual .build-deps ca-certificates wget git && yarn install --no-cache && apk del .build-deps


COPY . .

COPY ./docker/vue-storefront-api/vue-storefront-api.sh /usr/local/bin/

EXPOSE 8080

CMD ["vue-storefront-api.sh"]
