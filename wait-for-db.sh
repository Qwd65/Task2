#!/bin/bash

# Параметры для подключения
DB_HOST=db
DB_PORT=5432
TIMEOUT=30

echo "Waiting for PostgreSQL to start..."

for i in $(seq 1 $TIMEOUT); do
  if nc -z $DB_HOST $DB_PORT; then
    echo "PostgreSQL is up!"
    exit 0
  fi
  echo "PostgreSQL not available yet. Waiting..."
  sleep 1
done

echo "PostgreSQL did not become available in time."
exit 1


#set -e

#host="db"
#port="5432"
#cmd="$@"

#>&2 echo "Waiting for PostgreSQL to start..."

#until curl http://"$host":"$port"; do
#  >&2 echo "PostgreSQL not available yet. Waiting..."
#  sleep 1
#done
#
#>&2 echo "PostgreSQL did not become available in time."
#
#exec $cmd
