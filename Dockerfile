FROM ubuntu:latest AS builder

RUN apt-get update && apt-get install -y \
    build-essential \
    wget \
    unzip \
    font-manager

WORKDIR /tmp

# Download the latest release from Quackster/Havana
RUN wget -qO havana.zip https://github.com/Quackster/Havana/releases/download/release-1.2/Havana_v1.2.zip && \
    unzip havana.zip

FROM ubuntu:latest AS final

RUN apt-get update && apt-get install -y \
    openjdk-17-jre && \
    apt-get clean

#VOLUME ["/data"]
WORKDIR /data

STOPSIGNAL SIGTERM

COPY --from=builder /tmp/lib ./lib
COPY --from=builder /tmp/tools ./tools
COPY --from=builder /tmp/figuredata.xml .
COPY --from=builder /tmp/Havana-Web.jar .
COPY --from=builder /tmp/Havana-Server.jar .
COPY --from=builder --chmod=755 /tmp/run_web.sh .
COPY --from=builder --chmod=755 /tmp/run_server.sh .

COPY /files/www ./tools/www
COPY /files/log4j.properties .
COPY /files/log4j.web.properties .

COPY --chmod=755 scripts/havana* .

EXPOSE 80

ENTRYPOINT [ "./havana-start.sh" ]
