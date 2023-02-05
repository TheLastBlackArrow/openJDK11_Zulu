#!/bin/sh
mkdir -p /opt/java
cd /opt/java || exit
javaZuluName="zulu11.62.17-ca-jdk11.0.18-linux_aarch32hf"
curl -fsSL "https://cdn.azul.com/zulu-embedded/bin/${javaZuluName}.tar.gz" -o $javaZuluName.tar.gz
tar -xzvf $javaZuluName.tar.gz
echo remove tar file
rm $javaZuluName.tar.gz
echo changing folder
mv $javaZuluName openjdk11
# java path will create symlink: /usr/bin/java --> /etc/alternatives/java
# update-alternatives --install /usr/bin/java java /opt/java/openjdk/bin/java 1
# update-alternatives --install /usr/bin/javac javac /opt/java/openjdk/bin/javac 1
