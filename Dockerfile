FROM node:14.15.4-alpine as builder

COPY package.json package-lock.json ./
RUN npm install && mkdir /app && mv ./node_modules ./app

WORKDIR /app

COPY . .

RUN npm run build

FROM nginx:alpine

#!/bin/sh

COPY ./.nginx/nginx.conf /etc/nginx/nginx.conf

RUN rm -rf /usr/share/nginx/html/*

COPY --from=builder /app/out /usr/share/nginx/html

EXPOSE 3000 80

ENTRYPOINT ["nginx", "g", "daemon off;"]
