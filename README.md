# HAL

Yet another standup bot for slack.

![enter image description here](https://i.pinimg.com/736x/37/fc/04/37fc04b26400e79b07f0020ec15061f1--film--bay-door.jpg)

## Docker

### Requirements

* docker
* docker-composer

https://docs.docker.com/compose/install/

### Run containers

To run the rails web server:

```
docker-compose up web
```

Create a new Bot Integration under [services/new/bot](http://slack.com/services/new/bot).

To run the bot using docker-compose:

```
SLACK_API_TOKEN=xxxx-000000000000-x0x0x0x0x0x0x0x0x0x0x0x0x0x0x0x0x docker-compose up bot
```

To attatch to a container use the following command:
```
docker exec -i -t hal_bot_1 /bin/bash
```
