FROM debian:8.11-slim

RUN apt-get -y update --fix-missing
RUN apt-get -y install curl bash cron

RUN mkdir /workdir
WORKDIR /workdir
COPY install_gcloud_sdk.sh /workdir
RUN ./install_gcloud_sdk.sh

ADD . /workdir

CMD ["./entrypoint.sh"]
