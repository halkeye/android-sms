FROM bitriseio/android-ndk:v2021_05_29-08_17-b2417
ENV TOOL_VER_GO="1.18"
RUN curl -qs https://go.dev/dl/go${TOOL_VER_GO}.linux-amd64.tar.gz -O | tar xzf - -C /usr/local
