#!/bin/bash

namedir=`echo $HDFS_CONF_dfs_namenode_name_dir | perl -pe 's#file://##'`
if [ ! -d $namedir ]; then
  echo "Namenode name directory not found: $namedir"
  exit 2
fi


echo "remove lost+found from $namedir"
rm -r $namedir/lost+found


echo "Start checking"
if [ "`ls -A $namedir`" == "" ]; then
  echo "$namedir is empty"
  if [ "${ROLE,,}" == "active" ]; then
    echo "role is active"
    if [ -z "$CLUSTER_NAME" ]; then
      echo "Cluster name not specified"
      exit 2
    fi
    echo "Formatting namenode name directory: $namedir"
    echo "Y" | $HADOOP_HOME/bin/hdfs --config $HADOOP_CONF_DIR namenode -format -clusterid $CLUSTER_NAME
  else
    echo "BootStrapping namenode name directory: $namedir"
    $HADOOP_HOME/bin/hdfs --config $HADOOP_CONF_DIR namenode -bootstrapStandby
  fi
fi

$HADOOP_HOME/bin/hdfs --config $HADOOP_CONF_DIR namenode &
$HADOOP_HOME/bin/hdfs --config $HADOOP_CONF_DIR zkfc -formatZK -nonInteractive
$HADOOP_HOME/bin/hdfs --config $HADOOP_CONF_DIR zkfc
