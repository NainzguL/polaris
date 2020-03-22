FROM nginx:latest
RUN rm /etc/nginx/conf.d/default.conf
COPY container/nginx/site.conf /etc/nginx/conf.d
COPY public/ /var/www/
RUN touch /var/www/index.php