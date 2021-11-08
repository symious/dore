FROM symious/hadoop-base

HEALTHCHECK CMD curl -f http://localhost:50071/ || exit 1

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 8888

CMD ["/run.sh"]
