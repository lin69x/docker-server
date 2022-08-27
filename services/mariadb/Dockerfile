FROM mariadb:10.7


# Set logs files
# RUN chown 1000:1000 /var/log
# RUN chown 1000:1000 /var/log/mysql
RUN chmod 777 /var/log \
    && chmod 777 /var/log/mysql

RUN mkdir -p /var/backup

#VOLUME /var/log/mysql
#VOLUME /var/lib/mysql
#RUN touch /var/log/mysql/error.log && touch /var/log/mysql/mysql.log && touch /var/log/mysql/slow.log
# RUN chown mysql:mysql /var/log/mysql \
#   && chmod 0775 /var/log/mysql/ \
#   && touch /var/log/mysql/error.log \
#   && touch /var/log/mysql/mysql.log \
#   && touch /var/log/mysql/slow.log \
#   && chmod 0664 /var/log/mysql/error.log \
#   && chmod 0664 /var/log/mysql/mysql.log \
#   && chmod 0664 /var/log/mysql/slow.log

#USER mysql