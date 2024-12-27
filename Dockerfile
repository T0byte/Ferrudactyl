FROM alpine:3.21

# Identifying information for registries like ghcr.io
LABEL org.opencontainers.image.source=https://github.com/T0byte/Ferrudactyl

RUN apk add --no-cache libgcc &&\
    adduser --disabled-password --home /home/container container

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/bin/ash", "/entrypoint.sh" ]