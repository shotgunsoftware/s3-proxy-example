#!/usr/bin/env sh
set -eu

envsubst '${S3_BUCKET}' < /etc/nginx/conf.d/s3_proxy.conf.template > /etc/nginx/conf.d/s3_proxy.conf

exec "$@"