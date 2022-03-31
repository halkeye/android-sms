FROM bitriseio/android-ndk:v2021_05_29-08_17-b2417
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
RUN update-alternatives --auto javac && update-alternatives --auto java
ENV TOOL_VER_GO="1.18"
RUN rm -rf /usr/local/go; curl -L https://go.dev/dl/go${TOOL_VER_GO}.linux-amd64.tar.gz | tar xzf - -C /usr/local
