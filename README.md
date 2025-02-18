<p align="center">
  <a href="#">
    <img src="docs/banner.gif" alt="#SaveHabboHotel">
  </a>
</p>

<p align="center" style="text-decoration: none !important;">
    <a href="https://hub.docker.com/r/vitorvasc/docker-habbo-server/" style="text-decoration: none !important;">
        <img src="https://img.shields.io/docker/pulls/vitorvasc/docker-habbo-server.svg" alt="#SaveHabboHotel" />
    </a>
    <a href="https://hub.docker.com/r/vitorvasc/docker-habbo-server/" style="text-decoration: none !important;">
        <img src="https://img.shields.io/docker/stars/vitorvasc/docker-habbo-server.svg?maxAge=2592000" alt="#SaveHabboHotel" />
    </a>
    <a href="https://github.com/habboservers/docker-habbo-server/issues/" style="text-decoration: none !important;">
        <img src="https://img.shields.io/github/issues-raw/habboservers/docker-habbo-server.svg" alt="#SaveHabboHotel" />
    </a>
    <a href="https://github.com/vitorvasc/docker-habbo-server/actions/workflows/release-create-version.yaml" style="text-decoration: none !important;">
        <img src="https://github.com/habboservers/docker-habbo-server/actions/workflows/release-create-version.yaml/badge.svg" alt="#SaveHabboHotel" />
    </a>
</p>

# 👋 Getting started

Help us #SaveHabboHotel! This Docker Image provides a quick setup for your Habbo Hotel server, providing the necessary
configurations to run a Habbo Hotel Web Server alongside with an Emulator.

Join our Discord: [https://discord.gg/m2FHK6Vtqz](https://discord.gg/m2FHK6Vtqz)

## Supported versions

This image currently supports the following versions:

- [v31 - Quackster/Havana](https://github.com/Quackster/Havana)

### v31 - Quackster/Havana

Big thanks for [@Quackster](https://github.com/Quackster) on creating and maintaining this awesome project, so we can
get our server up and running by just following a few steps.

#### Settings

To change one of the following variables, you can pass the updated value through an environment variable. Visit
the [havana-mariadb-example](https://github.com/habboservers/docker-habbo-server/blob/0.0.6/examples/havana/havana-mariadb-example/docker-compose.yml)
for more details.

#### Database settings

The database settings applies for both server and web configurations. The values can be configured using the following environment variables:

| Env                       | Default value | Applies to   |
| ------------------------- | ------------- | ------------ |
| `HABBO_DATABASE_HOST`     | 127.0.0.1     | Server / Web |
| `HABBO_DATABASE_PORT`     | 3306          | Server / Web |
| `HABBO_DATABASE_USERNAME` | havana        | Server / Web |
| `HABBO_DATABASE_PASSWORD` | changeme      | Server / Web |
| `HABBO_DATABASE_NAME`     | havana        | Server / Web |

#### Server settings

| Env                                   | Default value | Applies to   |
| ------------------------------------- | ------------- | ------------ |
| `HABBO_SERVER_IP_BIND`                | 127.0.0.1     | Server       |
| `HABBO_SERVER_PORT`                   | 12321         | Server       |
| `HABBO_SERVER_LIMIT_BANDWIDTH`        | false         | Server       |
| `HABBO_SERVER_LIMIT_BANDWIDTH_AMOUNT` | 40960         | Server       |
| `HABBO_SERVER_RCON_IP_BIND`           | 127.0.0.1     | Server / Web |
| `HABBO_SERVER_RCON_PORT`              | 12309         | Server / Web |
| `HABBO_SERVER_MUS_IP_BIND`            | 40960         | Server       |
| `HABBO_SERVER_LOG_RECEIVED_PACKETS`   | false         | Server       |
| `HABBO_SERVER_LOG_SENT_PACKETS`       | false         | Server       |
| `HABBO_SERVER_DEBUG`                  | false         | Server       |

#### Web settings

| Env                                             | Default value         | Applies to |
| ----------------------------------------------- | --------------------- | ---------- |
| `HABBO_WEBSERVER_SITE_NAME`                     | Habbo                 | Web        |
| `HABBO_WEBSERVER_SITE_PATH`                     | http://localhost      | Web        |
| `HABBO_WEBSERVER_SITE_IMAGING_ENDPOINT`         | http://localhost:5000 | Web        |
| `HABBO_WEBSERVER_SITE_IMAGING_ENDPOINT_TIMEOUT` | 30000                 | Web        |
| `HABBO_WEBSERVER_SITE_DIRECTORY`                | tools/www             | Web        |
| `HABBO_WEBSERVER_STATIC_CONTENT_PATH`           | http://localhost      | Web        |
| `HABBO_WEBSERVER_MAINTENANCE`                   | false                 | Web        |
| `HABBO_WEBSERVER_PAGE_ENCODING`                 | utf-8                 | Web        |
| `HABBO_WEBSERVER_IP_BIND`                       | 127.0.0.1             | Web        |
| `HABBO_WEBSERVER_PORT`                          | 80                    | Web        |
| `HABBO_WEBSERVER_TEMPLATE_DIRECTORY`            | tools/www-tpl         | Web        |
| `HABBO_WEBSERVER_TEMPLATE_NAME`                 | default-en            | Web        |
| `HABBO_WEBSERVER_EMAIL_SMTP_ENABLE`             | false                 | Web        |
| `HABBO_WEBSERVER_EMAIL_STATIC_CONTENT_PATH`     | http://localhost      | Web        |
| `HABBO_WEBSERVER_EMAIL_SMTP_HOST`               | _(no value)_          | Web        |
| `HABBO_WEBSERVER_EMAIL_SMTP_PORT`               | 465                   | Web        |
| `HABBO_WEBSERVER_EMAIL_SMTP_LOGIN_USERNAME`     | _(no value)_          | Web        |
| `HABBO_WEBSERVER_EMAIL_SMTP_LOGIN_PASSWORD`     | _(no value)_          | Web        |
| `HABBO_WEBSERVER_EMAIL_SMTP_FROM_EMAIL`         | _(no value)_          | Web        |
| `HABBO_WEBSERVER_EMAIL_SMTP_FROM_NAME`          | _(no value)_          | Web        |

## 🦺 Help us keep the Habbo Hotel alive

If you feel like you can contribute with this project, feel free to open an [Issue](https://github.com/habboservers/docker-habbo-server/issues)!
