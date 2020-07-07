FROM arm64v8/ubuntu:latest

LABEL maintainer="Grégory Van den Borre vandenborre.gregory@hotmail.fr"

ENV JAVA_FILE=graalvm-ce-java11-linux-aarch64-20.1.0
ENV JAVA_HOME=/${JAVA_FILE}
ENV PATH="${PATH}:${JAVA_HOME}/bin"

RUN apt-get update && apt-get install -y -q wget \
&& wget https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-20.1.0/graalvm-ce-java11-linux-aarch64-20.1.0.tar.gz \
&& tar -xzvf graalvm-ce-java11-linux-aarch64-20.1.0.tar.gz \
&& java -version
