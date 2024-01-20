# Cross building for Raspberry OS Legacy
# Thus we need bullseye here

FROM arm64v8/debian:bullseye

RUN apt update
RUN apt install -y unzip curl clang cmake pkg-config git ninja-build libgtk-3-dev

RUN cd /opt && \
	git clone https://github.com/sony/flutter-elinux.git

ENV PATH=$PATH:/opt/flutter-elinux/bin

# Fetch flutter and elinux build tools
RUN flutter-elinux -v
RUN flutter-elinux precache --elinux


# Precache arm64 gtk build tools
RUN cd /tmp && \
  flutter-elinux create dummy && \
  cd dummy && \
  flutter-elinux build elinux && \
  cd && \
  rm -rf /tmp/dummy

VOLUME /root/.pub-cache

VOLUME /src

WORKDIR /src

ENTRYPOINT [ "flutter-elinux" ]

CMD [ "build", "elinux"	]