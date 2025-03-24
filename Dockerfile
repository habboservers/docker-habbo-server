FROM eclipse-temurin:21-jre-alpine

RUN apk add --no-cache \
    curl \
    unzip \
    bash \
    jq \
    font-manager

WORKDIR /opt

STOPSIGNAL SIGTERM

COPY /havana/files/log4j.properties /opt/havana/
COPY /havana/files/log4j.web.properties /opt/havana

RUN mkdir scripts
COPY --chmod=755 scripts/havana-* ./scripts

EXPOSE 80 12321 12323

ENTRYPOINT [ "/opt/scripts/havana-start" ]
