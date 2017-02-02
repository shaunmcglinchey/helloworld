FROM ubuntu:14.04

RUN apt-get update

# install unzip
RUN apt-get install unzip

# install gradle
# Not necessary -- include gradle wrapper in project source
ADD gradle-3.3-bin.zip /opt
RUN cd /opt && unzip gradle-3.3-bin.zip && rm gradle-3.3-bin.zip

#RUN chown -R battlecat /home/jenkins/gradle-3.3

# Install java7
RUN apt-get install -y software-properties-common \
    && add-apt-repository -y ppa:webupd8team/java \
    && apt-get update
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 \
    select true | /usr/bin/debconf-set-selections
RUN apt-get install -y oracle-java7-installer

# Install Deps
RUN dpkg --add-architecture i386 && apt-get update \
    && apt-get install -y --force-yes expect wget \
    libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5 lib32z1

# Install Android SDK
# RUN cd /opt && wget --output-document=android-sdk.tgz \
  #  http://dl.google.com/android/android-sdk_r24.3.3-linux.tgz \
  #  && tar xzf android-sdk.tgz && rm -f android-sdk.tgz \
  #  && chown -R root.root android-sdk-linux

#ADD tools_r25.2.3-linux.zip /opt
#RUN unzip tools_r25.2.3-linux.zip
#RUN rm -f tools_r25.2.3-linux.zip

# Setup environment
#ENV ANDROID_HOME /opt/android-sdk-linux

#ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

# ENV GRADLE_HOME /home/jenkins/gradle-3.3:$GRADLE_HOME/bin

# Install sdk elements
#COPY tools /opt/tools
#ENV PATH ${PATH}:/opt/tools
#RUN ["/opt/tools/android-accept-licenses.sh", \
#    "android update sdk --all --force --no-ui --filter platform-tools,tools,build-tools-23,build-tools-23.0.2,android-23,addon-google_apis_x86-google-23,extra-android-support,extra-android-m2repository,extra-google-m2repository,extra-google-google_play_services,sys-img-armeabi-v7a-android-23"]

# Cleaning
#RUN apt-get clean

# Go to workspace
#RUN mkdir -p /opt/workspace
#WORKDIR /opt/workspace
