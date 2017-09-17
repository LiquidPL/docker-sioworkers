FROM debian:stretch
ENV PYTHONUNBUFFERED 1

RUN useradd -m oioioi
COPY sioworkers /sio2/build
COPY run.sh /sio2

COPY sudo.sh /tmp
RUN /tmp/sudo.sh

USER oioioi
WORKDIR /sio2

COPY build.sh /tmp
RUN /tmp/build.sh

CMD ./run.sh
