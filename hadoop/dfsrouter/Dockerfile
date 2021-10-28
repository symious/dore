FROM symious/hadoop-base:3.4.0-SNAPSHOT_20211027

HEALTHCHECK CMD curl -f http://localhost:8888/ || exit 1

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 8888

CMD ["/run.sh"]
