FROM debian:12.8-slim

RUN (apt-get -y update --fix-missing || true) && \
  apt-get -y install curl bash cron gnupg python3

RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg && \
    (apt-get update -y || true) && \
    apt-get install -y google-cloud-sdk

WORKDIR /workdir
ADD . /workdir

CMD ["./entrypoint.sh"]
