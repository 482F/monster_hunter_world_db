#!/bin/bash

set -ue -o pipefail

SCRIPT_DIR=$(cd $(dirname "${0}"); pwd)

mysqldump -h localhost -P 58348 --skip-dump-date monster_hunter_world > "${SCRIPT_DIR}/monster_hunter_world.sql"
