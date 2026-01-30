#!/usr/bin/env bash
# ~/bin/do-zabbix-backup.sh
# =============================================================================
# This script performs a backup of Zabbix database
# and uploads that compressed DB dump to the FTP server.
# =============================================================================
# Written by Radislav (Radicchio) Golubtsov, 2022-2026.
#

# Helper constants.
declare -r EXIT_FAILURE=1 #    Failing exit status.
declare -r EXIT_SUCCESS=0 # Successful exit status.

# --- Payload - Begin ---------------------------------------------------------

declare -r DATABASE_NAME="zabbix"
declare -r ZBX_SERVER_IP="192.168.0.ZBX"
declare -r DATE_AND_TIME=`date "+%Y%m%d-%H%M"`
#                                 ^ ^ ^  ^ ^
#                                 | | |  | |
# Year ---------------------------+ | |  | |
# Month ----------------------------+ |  | |
# Day --------------------------------+  | |
# Hours ---------------------------------+ |
# Minutes ---------------------------------+

declare -r FULL_DBDUMP_NAME="${DATABASE_NAME}-${ZBX_SERVER_IP}-${DATE_AND_TIME}.sql"

declare -r FTP_SERVER_IP="192.168.0.FTP"

backup_store_dir=/var/local/zabbix/
db_username=root
db_password=<dbpassword>

mkdir -p ${backup_store_dir}

# Zabbix database backup.
mysqldump -u${db_username} -p${db_password} ${DATABASE_NAME} > ${backup_store_dir}${FULL_DBDUMP_NAME} && \
xz                                                             ${backup_store_dir}${FULL_DBDUMP_NAME}

# FTP-ing the compressed Zabbix DB dump.
# Note: See the ~/.netrc config for actual FTP commands to do the job.
ftp -p ${FTP_SERVER_IP}

# --- Payload - End -----------------------------------------------------------

# If there is an error -- telling the OS about this.
if [ $? -eq ${EXIT_FAILURE} ]; then
    exit    ${EXIT_FAILURE}
fi

exit        ${EXIT_SUCCESS}

# vim:set nu et ts=4 sw=4:
