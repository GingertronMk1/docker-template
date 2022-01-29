FROM node:16-alpine

RUN apk add --no-cache bash rsync

WORKDIR /src

COPY . .

RUN mkdir -p /src/cache

RUN npm install && mv /src/node_modules /src/cache

RUN cp /src/etc/entrypoints/node.sh /usr/bin/entrypoint && \
    chmod +x /usr/bin/entrypoint
