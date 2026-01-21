FROM eclipse-temurin:25-jre-alpine

ARG BUILD_DATE
ARG VERSION
ARG VCS_REF

LABEL org.opencontainers.image.created="${BUILD_DATE}" \
      org.opencontainers.image.version="${VERSION}" \
      org.opencontainers.image.revision="${VCS_REF}" \
      org.opencontainers.image.title="docker-habbo-server" \
      org.opencontainers.image.description="Docker image for running Habbo Servers effortlessly" \
      org.opencontainers.image.documentation="https://github.com/habboservers/docker-habbo-server/tree/main/docs"

# hadolint ignore=DL3018
RUN apk add --no-cache \
    curl \
    unzip \
    bash \
    jq \
    font-manager

# Create non-root user
RUN addgroup -g 1000 havana && \
    adduser -D -u 1000 -G havana havana

WORKDIR /opt

# Create directories and set permissions
RUN mkdir -p scripts /opt/havana /tmp && \
    chown -R havana:havana /opt /tmp

STOPSIGNAL SIGTERM

COPY --chown=havana:havana /havana/files/log4j.properties /opt/havana/
COPY --chown=havana:havana /havana/files/log4j.web.properties /opt/havana/

COPY --chmod=755 --chown=havana:havana scripts/havana-* ./scripts/
RUN mkdir -p scripts/lib
COPY --chmod=755 --chown=havana:havana scripts/lib/ ./scripts/lib/

USER havana

EXPOSE 80 12321 12323

ENTRYPOINT [ "/opt/scripts/havana-start" ]
