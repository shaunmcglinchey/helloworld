# Set the base image to Ubuntu 14.04
FROM ubuntu:14.04

# update the yum
#RUN yum -y update

# install unzip via yum
RUN yum -y install unzip

# install jdk, as on a clean fedora image, no java is installed
ADD jdk-8u121-linux-x64.rpm /home/jenkins/

# install java to /usr/java/jdk1.8.0_91/jre/bin/java
RUN yum -y localinstall /home/jenkins/jdk-8u121-linux-x64.rpm

# Now JDK was installed at /usr/java/jdk1.8.0_91/ and linked from /usr/bin/java
RUN java -version
