FROM nginx:1.20.2-alpine

RUN rm /etc/nginx/conf.d/default.conf
COPY ./sites/* /etc/nginx/conf.d

RUN apk update && apk upgrade --no-cache