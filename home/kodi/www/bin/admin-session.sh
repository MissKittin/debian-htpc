#!/bin/sh

ps -A | grep admin-desktop > /dev/null 2>&1 && echo -n "true" || echo -n "false"

exit 0