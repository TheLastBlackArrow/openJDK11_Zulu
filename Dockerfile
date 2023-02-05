# No docker image support java 11 on arm32v6 therefore I want to use Zulu
# always using latest cause pi1 will be supported by raspberian
FROM debian:bullseye-slim

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    unzip \
  && rm -rf /var/lib/apt/lists/*

ENV LANG C.UTF-8
# download openjdk from Zulu website
COPY ./install-java.sh ./install-java.sh
RUN chmod +x ./install-java.sh && ./install-java.sh
ENV JAVA_JDK_HOME=/opt/java/openjdk11

# Create a custom Java runtime
ENV JAVA_HOME=/opt/java/openjdk
ENV PATH "${JAVA_HOME}/bin:${PATH}"

RUN $JAVA_JDK_HOME/bin/jlink \
         --add-modules ALL-MODULE-PATH \
         --strip-debug \
         --no-man-pages \
         --no-header-files \
         --compress=2 \
         --output /javaruntime

# COPY ./javaruntime/ ${JAVA_HOME}/

RUN java -version
