#!/bin/ash

set -e

echo "$(date) - Start"

aws s3 sync s3://$BUCKET$BUCKET_PATH $DATA_PATH $PARAMS

echo "$(date) End"
