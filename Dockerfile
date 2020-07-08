FROM arm64v8/ubuntu:latest

LABEL maintainer="Grégory Van den Borre vandenborre.gregory@hotmail.fr"

ENV JAVA_FILE=graalvm-ce-java11-20.1.0
ENV JAVA_HOME=/${JAVA_FILE}
ENV M2_HOME=/apache-maven-3.6.3
ENV PATH="${PATH}:${JAVA_HOME}/bin:$(M2_HOME)/bin"

RUN apt-get update && apt-get install -y -q wget gcc libc6-dev zlib1g-dev \
&& wget -q https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-20.1.0/graalvm-ce-java11-linux-aarch64-20.1.0.tar.gz \
&& tar -xzf graalvm-ce-java11-linux-aarch64-20.1.0.tar.gz \
&& java -version \
&& rm graalvm-ce-java11-linux-aarch64-20.1.0.tar.gz \
&& wget -q https://apache.belnet.be/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz \
&& tar -xvzf apache-maven-3.6.3-bin.tar.gz \
&& mvn -v \
&& rm apache-maven-3.6.3-bin.tar.gz \
&& apt-get purge -y -q wget

RUN gu install native-image
