FROM arm64v8/ubuntu:latest

LABEL maintainer="Grégory Van den Borre vandenborre.gregory@hotmail.fr"

ENV GRAALVM_VERSION=20.2.0
ENV MAVEN_VERSION=3.6.3

ENV JAVA_FILE=graalvm-ce-java11-${GRAALVM_VERSION}
ENV JAVA_HOME=/${JAVA_FILE}
ENV M2_HOME=/apache-maven-${MAVEN_VERSION}
ENV PATH="${PATH}:${JAVA_HOME}/bin:${M2_HOME}/bin"

RUN apt-get update && apt-get install -y -qq -o Dpkg::Use-Pty=0 wget gcc libc6-dev zlib1g-dev \
&& wget -q https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-${GRAALVM_VERSION}/graalvm-ce-java11-linux-aarch64-${GRAALVM_VERSION}.tar.gz \
&& tar -xzf graalvm-ce-java11-linux-aarch64-${GRAALVM_VERSION}.tar.gz \
&& java -version \
&& rm graalvm-ce-java11-linux-aarch64-${GRAALVM_VERSION}.tar.gz \
&& wget -q https://apache.belnet.be/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
&& tar -xzf apache-maven-${MAVEN_VERSION}-bin.tar.gz \
&& rm apache-maven-${MAVEN_VERSION}-bin.tar.gz \
&& mvn -v \
&& apt-get purge -y -q wget

RUN gu install native-image
