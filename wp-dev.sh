#!/usr/bin/env bash

# Add colors in bash
RED="\e[31m"
GREEN="\e[32m"
BLUE="\e[34m"
ENDCOLOR="\e[0m"
TICK="\xE2\x9C\x94"
CROSS="\xE2\x9D\x8C"

# Load environment variables
set -a ; . ./.env ; set +a

show_operation_status() {
  CURRENT_RESULT=${1}
  OPERATION=${2}
  if (( CURRENT_RESULT != 0 )); then
    echo -e "${RED}${CROSS} ${OPERATION} failed!${ENDCOLOR}"
  else
    echo -e "${GREEN}${TICK} ${OPERATION} done!${ENDCOLOR}"
  fi
}

# Run UP, DOWN, BACKUP or RESTORE command based on the first argument
if [ "$1" == "up" ]; then
  echo -e "${BLUE}Starting Wordpress docker-compose...${ENDCOLOR}"
  docker-compose up -d
  RESULT=$?
  show_operation_status ${RESULT} "Starting"
  exit ${RESULT}
elif [ "$1" == "down" ]; then
  echo -e "${BLUE}Backup database...${ENDCOLOR}"
  docker exec db sh -c 'exec mysqldump -uroot -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE"' > ./dump.sql
  RESULT=$?
  show_operation_status ${RESULT} "Backup"
  echo -e "${BLUE}Stopping Wordpress docker-compose...${ENDCOLOR}"
  docker-compose down
  RESULT=$?
  show_operation_status ${RESULT} "Stopping"
  exit ${RESULT}
elif [ "$1" == "backup" ]; then
  echo -e "${BLUE}Backup database...${ENDCOLOR}"
  docker exec db sh -c 'exec mysqldump -uroot -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE"' > ./dump.sql
  RESULT=$?
  show_operation_status ${RESULT} "Backup"
  exit ${RESULT}
elif [ "$1" == "restore" ]; then
  echo -e "${BLUE}Restore database...${ENDCOLOR}"
  docker exec db sh -c 'exec mysql -uroot -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE"' < ./dump.sql
  RESULT=$?
  show_operation_status ${RESULT} "Restore"
  exit ${RESULT}
else
  echo -e "${RED}${CROSS} Invalid argument${ENDCOLOR}"
  exit 1
fi