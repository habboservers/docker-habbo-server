FROM eclipse-temurin:21-jre-alpine

RUN apk add --no-cache \
    curl \
    unzip \
    bash \
    jq

WORKDIR /data

STOPSIGNAL SIGTERM

COPY /havana/files/log4j.properties /data/havana/
COPY /havana/files/log4j.web.properties /data/havana

RUN mkdir scripts
COPY --chmod=755 scripts/havana-* ./scripts

EXPOSE 80 12321 12323

ENTRYPOINT [ "/data/scripts/havana-start" ]
