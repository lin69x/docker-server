FROM certbot/certbot
FROM nginx:mainline-alpine
#COPY /etc/nginx ./nginxq

RUN apk update && apk add bash certbot logrotate

#Configure NGINX
# COPY .nginx/nginx.conf /etc/nginx/
COPY ./hosts/*.conf /etc/nginx/http.d/

COPY ./configs/nginx.conf /etc/nginx/nginx.conf
RUN mkdir -p /etc/nginx/configs/
COPY ./configs /etc/nginx/configs/

#Configure Logrotate
COPY ./configs/logrotate/logrotate.conf /etc/logrotate.conf
COPY ./configs/logrotate/nginx /etc/logrotate.d/nginx
RUN chmod 644 /etc/logrotate.d/nginx

# RUN mkdir -p /run/nginx/
# RUN touch /run/nginx/nginx.pid

RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

WORKDIR /var/www
