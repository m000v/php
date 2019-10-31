#!/bin/bash

if [[ "php-fpm${PHP_VERSION}" == "$1" ]]; then
    touch /run/php/.checkfpm
fi

/prepare.sh

[[ -f /prepare-command.sh ]] && bash /prepare-command.sh

if [[ 0 = "$UID" ]] && [[ "php-fpm${PHP_VERSION}" != "$1" ]] && [[ "/bin/bash" != "$1" ]]; then
    exec gosu www-data "$@"
else
    exec "$@"
fi
