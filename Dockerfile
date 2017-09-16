FROM debian:8.0
ENV PYTHONUNBUFFERED 1

RUN useradd -m oioioi
COPY sioworkers /sio2/sioworkers
COPY supervisord.conf /sio2/sioworkers/config

COPY sudo.sh /tmp
RUN /tmp/sudo.sh

USER oioioi
WORKDIR /sio2

COPY build.sh /tmp
RUN /tmp/build.sh

