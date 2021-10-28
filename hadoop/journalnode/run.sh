#!/bin/bash

journaldir=`echo $HDFS_CONF_dfs_journaldir_edits_dir | perl -pe 's#file://##'`
if [ ! -d $journaldir]; then
  echo "Journalnode edits directory not found: $journaldir"
  exit 2
fi

$HADOOP_HOME/bin/hdfs --config $HADOOP_CONF_DIR journalnode