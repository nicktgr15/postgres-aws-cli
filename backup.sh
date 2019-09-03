#! /bin/sh

set -e

PGPASSWORD=${POSTGRES_PASSWORD} pg_dumpall -h ${POSTGRES_HOST} -p 5432 -U ${POSTGRES_USER} | gzip > dump.sql.gz

AWS_ACCESS_KEY_ID=${S3_ACCESS_KEY_ID} AWS_SECRET_ACCESS_KEY=${S3_SECRET_ACCESS_KEY} aws s3 cp dump.sql.gz s3://${S3_BUCKET}/${S3_PREFIX}/all_dbs_$(date +"%Y-%m-%dT%H:%M:%SZ").sql.gz

echo "SQL backup uploaded successfully"
