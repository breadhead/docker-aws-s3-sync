FROM alpine:3.3

RUN apk --no-cache add \
      py-pip \
      python &&\
    pip install --upgrade \
      pip \
      awscli

ENV KEY=,SECRET=,REGION=,BUCKET=,BUCKET_PATH=/,DATA_PATH=,CRON_SCHEDULE="0 1 * * *",PARAMS=

ADD *.sh /
RUN chmod +x /*.sh

ENTRYPOINT ["/start.sh"]
CMD [""]
