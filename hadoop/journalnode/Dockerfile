FROM symious/hadoop-base

HEALTHCHECK CMD curl -f http://localhost:8480/ || exit 1

ENV HDFS_CONF_dfs_journalnode_edits_dir=file:///hadoop/dfs/journal
RUN mkdir -p /hadoop/dfs/journal
VOLUME /hadoop/dfs/journal

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 8480

CMD ["/run.sh"]
