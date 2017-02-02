FROM ubuntu:16.04

# support multiarch: i386 architecture
# install Java
# install essential tools
# install Qt
RUN dpkg --add-architecture i386 && \
    apt-get update -y && \
    apt-get install -y libncurses5:i386 libc6:i386 libstdc++6:i386 lib32gcc1 lib32ncurses5 lib32z1 zlib1g:i386 && \
    apt-get install -y --no-install-recommends openjdk-8-jdk && \
    apt-get install -y git wget zip && \
    apt-get install -y qt5-default

# install gradle
COPY gradle-3.3-bin.zip /opt
RUN cd /opt && unzip gradle-3.3-bin.zip && mv gradle-3.3 gradle && rm gradle-3.3-bin.zip

# install Android SDK
RUN mkdir -p /opt/android-sdk

# add the Android SDK
#COPY android-sdk /opt/android-sdk

COPY tools_r25.2.3-linux.zip /opt/android-sdk
RUN cd /opt/android-sdk && unzip tools_r25.2.3-linux.zip && rm -f tools_r25.2.3-linux.zip


# set the environment variables
ENV ANDROID_SDK_VERSION=r25.2.3 \
    ANDROID_BUILD_TOOLS_VERSION=24.0.2 \
    ANDROID_API_LEVELS=android-25 \
    JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64 \
    GRADLE_HOME=/opt/gradle \
    ANDROID_HOME=/opt/android-sdk
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools/bin:${GRADLE_HOME}/bin

# accept the license agreements of the SDK components
RUN export ANDROID_LICENSES="$ANDROID_HOME/licenses" && \
    [ -d $ANDROID_LICENSES ] || mkdir $ANDROID_LICENSES && \
    [ -f $ANDROID_LICENSES/android-sdk-license ] || echo 8933bad161af4178b1185d1a37fbf41ea5269c55 > $ANDROID_LICENSES/android-sdk-license && \
    [ -f $ANDROID_LICENSES/android-sdk-preview-license ] || echo 84831b9409646a918e30573bab4c9c91346d8abd > $ANDROID_LICENSES/android-sdk-preview-license && \
    [ -f $ANDROID_LICENSES/intel-android-extra-license ] || echo d975f751698a77b662f1254ddbeed3901e976f5a > $ANDROID_LICENSES/intel-android-extra-license && \
    unset ANDROID_LICENSES

# Install sdk elements
RUN echo y | android update sdk --no-ui -a --filter tools,platform-tools,${ANDROID_API_LEVELS},build-tools-${ANDROID_BUILD_TOOLS_VERSION},extra-android-support,extra-android-m2repository,extra-google-m2repository

# Go to workspace
RUN mkdir -p /opt/workspace
WORKDIR /opt/workspace
