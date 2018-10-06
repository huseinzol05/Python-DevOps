FROM ubuntu:16.04 AS base

ENV HADOOP_HOME /opt/hadoop
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-wheel \
    openjdk-8-jdk \
    supervisor

RUN wget http://apache.crihan.fr/dist/hadoop/common/hadoop-3.1.0/hadoop-3.1.0.tar.gz && \
    tar -xzf hadoop-3.1.0.tar.gz && \
    mv hadoop-3.1.0 $HADOOP_HOME && \
    for user in hadoop hdfs yarn mapred; do \
        useradd -U -M -d /opt/hadoop/ --shell /bin/bash ${user}; \
    done && \
    for user in root hdfs yarn mapred; do \
        usermod -G hadoop ${user}; \
    done && \
    echo "export JAVA_HOME=$JAVA_HOME" >> $HADOOP_HOME/etc/hadoop/hadoop-env.sh && \
    echo "export HDFS_DATANODE_USER=root" >> $HADOOP_HOME/etc/hadoop/hadoop-env.sh && \
    echo "export HDFS_NAMENODE_USER=root" >> $HADOOP_HOME/etc/hadoop/hadoop-env.sh && \
    echo "export HDFS_SECONDARYNAMENODE_USER=root" >> $HADOOP_HOME/etc/hadoop/hadoop-env.sh && \
    echo "export YARN_RESOURCEMANAGER_USER=root" >> $HADOOP_HOME/etc/hadoop/yarn-env.sh && \
    echo "export YARN_NODEMANAGER_USER=root" >> $HADOOP_HOME/etc/hadoop/yarn-env.sh && \
    echo "PATH=$PATH:$HADOOP_HOME/bin" >> ~/.bashrc

RUN \
    ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && \
    chmod 0600 ~/.ssh/authorized_keys

ADD *xml $HADOOP_HOME/etc/hadoop/

ADD ssh_config /root/.ssh/config

ADD start-all.sh start-all.sh

RUN pip3 install Flask
RUN pip3 install werkzeug

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

WORKDIR /app

COPY . /app
