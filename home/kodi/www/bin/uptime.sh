#!/bin/sh
. ./lib/sh/library.rc

uptime -p |
sed -e 's/up/ /g' |
sed -e 's/days/dni/g' |
sed -e 's/hour/godzina/g' |
sed -e 's/hours/godzin/g' |
sed -e 's/minutes/minut/g' |
xargs | $NO_NEWLINE

exit 0