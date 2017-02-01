# Set the base image to Ubuntu 14.04
FROM ubuntu:14.04

# Install java7
RUN apt-get update && \
  apt-get install -y software-properties-common && \
  add-apt-repository -y ppa:webupd8team/java && \
  (echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections) && \
  apt-get update && \
  apt-get install -y oracle-java7-installer && \
  apt-get clean && \
  rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/*

# update the yum
#RUN yum -y update

# install unzip via yum
#RUN yum -y install unzip

# install jdk, as on a clean fedora image, no java is installed
#ADD jdk-8u121-linux-x64.rpm /home/jenkins/

# install java to /usr/java/jdk1.8.0_91/jre/bin/java
#RUN yum -y localinstall /home/jenkins/jdk-8u121-linux-x64.rpm
#RUN rpm -ivh /home/jenkins/jdk-8u121-linux-x64.rpm

# Now JDK was installed at /usr/java/jdk1.8.0_91/ and linked from /usr/bin/java
#RUN java -version
