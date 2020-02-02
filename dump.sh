#!/bin/bash

set -ue -o pipefail

SCRIPT_DIR=$(cd $(dirname "${0}"); pwd)
HOSTNAME="localhost"
PORT="58348"
DATABASE_NAME="monster_hunter_world"
DATABASE_DUMP_FILE="${SCRIPT_DIR}/${DATABASE_NAME}.sql"
CONNECT_CONSECUTIVE_INSERT="${SCRIPT_DIR}/connect_consecutive_insert.py"
CONNECT_CONSECUTIVE_INSERT_URL="https://raw.githubusercontent.com/482F/misc/master/connect_consecutive_insert.py"

mysqldump -h "${HOSTNAME}" -P "${PORT}" --skip-dump-date "${DATABASE_NAME}" > "${DATABASE_DUMP_FILE}"

if [ ! -e "${CONNECT_CONSECUTIVE_INSERT}" ]; then
    curl "${CONNECT_CONSECUTIVE_INSERT_URL}" > "${CONNECT_CONSECUTIVE_INSERT}"
    chmod 744 "${CONNECT_CONSECUTIVE_INSERT}"
fi

"${CONNECT_CONSECUTIVE_INSERT}" "${DATABASE_DUMP_FILE}" > "${DATABASE_DUMP_FILE}"
