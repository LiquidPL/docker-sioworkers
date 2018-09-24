FROM debian:stretch
ENV PYTHONUNBUFFERED 1

COPY sudo.sh /tmp
RUN /tmp/sudo.sh

RUN useradd -m oioioi

USER oioioi
WORKDIR /sio2

COPY build.sh /tmp
RUN /tmp/build.sh

COPY supervisord.conf /sio2/sioworkers/
COPY logging.json /sio2/sioworkers/
COPY run.sh /sio2

CMD ./run.sh
