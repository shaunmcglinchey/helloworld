# Set the base image to Cent OS v. 7
FROM centos:7

# update the yum
RUN yum -y update

# install unzip via yum
RUN yum -y install unzip

# install jdk, as on a clean fedora image, no java is installed
ADD jdk-8u121-linux-x64.rpm /home/jenkins/
