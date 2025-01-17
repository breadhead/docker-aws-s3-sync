#!/bin/ash

set -e

export AWS_ACCESS_KEY_ID=$KEY
export AWS_SECRET_ACCESS_KEY=$SECRET
export AWS_DEFAULT_REGION=$REGION

if [[ "$1" == 'now' ]]; then
    exec /sync.sh
elif [[ "$1" == 'backward-now' ]]; then
    exec /sync_backward.sh
elif [[ "$1" == 'backward' ]]; then
    echo "$CRON_SCHEDULE /sync_backward.sh" >> /var/spool/cron/crontabs/root
    crond -l 2 -f
else
    echo "$CRON_SCHEDULE /sync.sh" >> /var/spool/cron/crontabs/root
    crond -l 2 -f
fi
