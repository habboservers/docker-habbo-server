FROM alpine:latest AS builder

WORKDIR /tmp

RUN apk add --no-cache \
    curl \
    unzip \
    bash

# Download the latest release from Quackster/Havana and the /www folder
RUN curl -sL -o havana.zip https://github.com/Quackster/Havana/releases/download/release-1.2/Havana_v1.2.zip && \
    unzip havana.zip && \
    rm havana.zip && \
    mkdir -p ./tools/www && \
    curl -sL -o www.zip https://cdn.habboservers.vasconcellos.tech/build/havana/v1.2/www.zip && \
    unzip www.zip -d ./tools && \
    rm www.zip

# Copy and create the config files
COPY /havana/files/log4j.properties .
COPY /havana/files/log4j.web.properties .
COPY --chmod=755 scripts/havana-setup* .

# Run the setup script
RUN ./havana-setup.sh

FROM eclipse-temurin:17-jre-jammy AS final

WORKDIR /data

STOPSIGNAL SIGTERM

# Commons
COPY --from=builder /tmp/lib ./lib
COPY --from=builder /tmp/tools ./tools
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
