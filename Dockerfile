ARG BUILD_FROM
FROM $BUILD_FROM

MAINTAINER Elad Bar <elad.bar@hotmail.com>

WORKDIR /app

COPY DahuaEventHandler.php ./DahuaVTO.php
COPY phpMQTT.php ./phpMQTT.php

RUN apk add --no-cache --update argon2-libs php php-json && \
apk add --no-cache --virtual .build-dependencies git && \
chmod +x /app/DahuaVTO.php && \
apk del .build-dependencies

COPY data/run.sh .
CMD ./run.sh