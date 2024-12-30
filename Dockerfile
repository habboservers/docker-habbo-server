FROM ubuntu:latest AS builder

RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    font-manager

WORKDIR /tmp

# Download the latest release from Quackster/Havana
RUN wget -qO havana.zip https://github.com/Quackster/Havana/releases/download/release-1.2/Havana_v1.2.zip && \
    unzip havana.zip

# Download the www files
RUN mkdir ./tools/www && \
    wget -qO www.zip https://cdn.habboservers.vasconcellos.tech/build/havana/v1.2/www.zip && \
    unzip www.zip -d ./tools/www

# Copy and create the config files
COPY /havana/files/log4j.properties .
COPY /havana/files/log4j.web.properties .

COPY --chmod=755 scripts/havana-setup* .

RUN [ "./havana-setup.sh" ]

FROM ubuntu:latest AS final

RUN apt-get update && apt-get install -y \
    openjdk-17-jre && \
    apt-get clean

WORKDIR /data

STOPSIGNAL SIGTERM

# Commons
COPY --from=builder /tmp/lib ./lib
COPY --from=builder /tmp/tools ./tools
COPY --from=builder /tmp/tools/www ./tools/www
COPY --from=builder /tmp/figuredata.xml .

# Web
COPY --from=builder /tmp/Havana-Web.jar .
COPY --from=builder /tmp/log4j.web.properties .
COPY --from=builder /tmp/webserver-config.ini .
COPY --from=builder --chmod=755 /tmp/run_web.sh .

# Server
COPY --from=builder /tmp/Havana-Server.jar .
COPY --from=builder /tmp/log4j.properties .
COPY --from=builder /tmp/server.ini .
COPY --from=builder --chmod=755 /tmp/run_server.sh .

# Start script
COPY --chmod=755 scripts/havana-start.sh .

EXPOSE 80

ENTRYPOINT [ "./havana-start.sh" ]
