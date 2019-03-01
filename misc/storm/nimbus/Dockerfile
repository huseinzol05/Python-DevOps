FROM ubuntu:18.04 AS base

# Install required packages

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

RUN apt-get update && \
    apt-get install -y python3-pip openjdk-8-jdk-headless supervisor wget curl

RUN apt install leiningen -y

# Install Java.
RUN echo '(exit)' | lein

RUN pip3 install streamparse jupyter

# Install Storm.

ENV STORM_CONF_DIR=/conf \
    STORM_DATA_DIR=/data \
    STORM_LOG_DIR=/logs

# Add a user and make dirs
RUN mkdir -p "$STORM_CONF_DIR" "$STORM_DATA_DIR" "$STORM_LOG_DIR"

ARG DISTRO_NAME=apache-storm-1.2.1

# Download Apache Storm.
RUN set -ex; \
    wget -q "http://www.apache.org/dist/storm/$DISTRO_NAME/$DISTRO_NAME.tar.gz"; \
    export GNUPGHOME="$(mktemp -d)"; \
    tar -xzf "$DISTRO_NAME.tar.gz"; \
    rm "$DISTRO_NAME.tar.gz";

ENV PATH $PATH:/$DISTRO_NAME/bin

ADD storm.yaml /conf

# Install Maven.

ENV MAVEN_VERSION="3.5.3" \
    M2_HOME=/usr/lib/mvn

RUN cd /tmp && \
    wget "https://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz" && \
    tar -zxvf "apache-maven-$MAVEN_VERSION-bin.tar.gz" && \
    mv "apache-maven-$MAVEN_VERSION" "$M2_HOME" && \
    ln -s "$M2_HOME/bin/mvn" /usr/bin/mvn && \
    rm -R /tmp/*

WORKDIR /app

ADD . /app

RUN jupyter notebook --generate-config
RUN echo "" >> /root/.jupyter/jupyter_notebook_config.py
RUN echo "c.NotebookApp.token = ''" >> /root/.jupyter/jupyter_notebook_config.py
