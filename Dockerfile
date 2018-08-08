FROM alpine:3.8

LABEL licence="MIT License" \
      maintener="Takeru Naito <takeru.naito@gmail.com>" \
      version="0.0.2"

ENV TZ Asia/Tokyo
ENV WORKDIR /var/app

WORKDIR $WORKDIR

RUN set -xe \
  && mkdir -p $WORKDIR \
  && apk add --no-cache \
    curl=7.61.0-r0 \
    jq=1.6_rc1-r1

COPY accepter.sh .
COPY crontab /var/spool/cron/crontabs/root

CMD ["crond", "-f", "-d", "8"]
