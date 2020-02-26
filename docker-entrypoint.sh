#!/usr/bin/env sh
set -eu

export NAMESERVER=`cat /etc/resolv.conf | grep "nameserver" | awk '{print $2}' | tr '\n' ' '`

echo "S3 bucket : ${S3_BUCKET}" 
echo "nameserver: ${NAMESERVER}" 
envsubst '${S3_BUCKET},${NAMESERVER}' < /etc/nginx/conf.d/s3_proxy.conf.template > /etc/nginx/conf.d/s3_proxy.conf

exec "$@"