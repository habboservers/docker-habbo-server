<p align="center">
  <a href="#">
    <img src="docs/banner.gif" alt="#SaveHabboHotel">
  </a>
</p>

<p align="center">
    <a href="https://hub.docker.com/r/vitorvasc/docker-habbo-server/">
        <img src="https://img.shields.io/docker/pulls/vitorvasc/docker-habbo-server.svg" alt="#SaveHabboHotel" />
    </a>
    <a href="https://hub.docker.com/r/vitorvasc/docker-habbo-server/">
        <img src="https://img.shields.io/docker/stars/vitorvasc/docker-habbo-server.svg?maxAge=2592000" alt="#SaveHabboHotel" />
    </a>
    <a href="https://github.com/habboservers/docker-habbo-server/issues/">
        <img src="https://img.shields.io/github/issues-raw/habboservers/docker-habbo-server.svg" alt="#SaveHabboHotel" />
    </a>
    <a href="https://github.com/vitorvasc/docker-habbo-server/actions/workflows/docker-image.yml">
        <img src="https://github.com/habboservers/docker-habbo-server/actions/workflows/docker-image.yml/badge.svg" alt="#SaveHabboHotel" />
    </a>
</p>

# 👋 Getting started

Help us #SaveHabboHotel! This Docker Image provides a quick setup for your Habbo Hotel server, providing the necessary
configurations to run a Habbo Hotel Web Server alongside with an Emulator.

Join our Discord: (https://discord.gg/m2FHK6Vtqz)[https://discord.gg/m2FHK6Vtqz]

## Supported versions

This image currently supports the following versions:

* [v31 - Quackster/Havana](https://github.com/Quackster/Havana)


### v31 - Quackster/Havana

Big thanks for [@Quackster](https://github.com/Quackster) on creating and maintaining this awesome project, so we can
get our server up and running by just following a few steps.

#### Settings

To change one of the following variables, you can pass the updated value through an environment variable. Visit
the [havana-mariadb-example](https://github.com/habboservers/docker-habbo-server/blob/0.0.6/examples/havana/havana-mariadb-example/docker-compose.yml)
for more details.

#### Database settings

| Env                    | Default value |
|------------------------|---------------|
| `HABBO_DATABASE_HOST`     | 127.0.0.1     | 
| `HABBO_DATABASE_PORT`     | 3306          | 
| `HABBO_DATABASE_USERNAME` | havana        |  
| `HABBO_DATABASE_PASSWORD` | changeme      |
| `HABBO_DATABASE_NAME` | havana        |  

#### Server settings

| Env                                   | Default value |
|---------------------------------------|---------------|
| `HABBO_SERVER_IP_BIND`                | 127.0.0.1     | 
| `HABBO_SERVER_PORT`                   | 12321         |
| `HABBO_SERVER_LIMIT_BANDWIDTH`        | false         |
| `HABBO_SERVER_LIMIT_BANDWIDTH_AMOUNT` | 40960         |
| `HABBO_SERVER_RCON_IP_BIND`           | 127.0.0.1     |
| `HABBO_SERVER_RCON_PORT`              | 12309         |
| `HABBO_SERVER_MUS_IP_BIND`            | 40960         |
| `HABBO_SERVER_LOG_RECEIVED_PACKETS`   | false         |
| `HABBO_SERVER_LOG_SENT_PACKETS`       | false         |
| `HABBO_SERVER_DEBUG`                  | false         |

#### Web settings

| Env                                  | Default value |
|--------------------------------------|---------------|
| `HABBO_WEBSERVER_SITE_DIRECTORY`     | tools/www     | 
| `HABBO_WEBSERVER_IP_BIND`            | 127.0.0.1     |
| `HABBO_WEBSERVER_PORT`               | 80            |
| `HABBO_WEBSERVER_TEMPLATE_DIRECTORY` | tools/www-tpl |
| `HABBO_WEBSERVER_TEMPLATE_NAME`      | default-en    |
| `HABBO_WEBSERVER_PAGE_ENCODING`      | utf-8         |

## 🦺 Help us keep the Habbo Hotel alive

If you feel like you can contribute with this project, feel free to open an [Issue](https://github.com/habboservers/docker-habbo-server/issues)! 
