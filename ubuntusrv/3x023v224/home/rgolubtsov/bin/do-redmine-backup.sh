#!/usr/bin/env bash
# ~/bin/do-redmine-backup.sh
# =============================================================================
# This script performs a complete backup of the whole Redmine installation
# along with its corresponding database, ~and uploads those tarballs
# to the FTP server.~
# =============================================================================
# Written by Radislav (Radicchio) Golubtsov, 2022-2026.
#

# Helper constants.
declare -r EXIT_FAILURE=1 #    Failing exit status.
declare -r EXIT_SUCCESS=0 # Successful exit status.

# --- Payload - Begin ---------------------------------------------------------

declare -r REDMINE="redmine"
declare -r VERSION="5.0.2"

declare -r  TARBALL_NAME="${REDMINE}-${VERSION}"
declare -r DATABASE_NAME="${REDMINE}"
declare -r WEB_SERVER_IP="192.168.0.WEB"
declare -r DATE_AND_TIME=`date "+%Y%m%d-%H%M"`
#                                 ^ ^ ^  ^ ^
#                                 | | |  | |
# Year ---------------------------+ | |  | |
# Month ----------------------------+ |  | |
# Day --------------------------------+  | |
# Hours ---------------------------------+ |
# Minutes ---------------------------------+

declare -r FULL_TARBALL_NAME="${TARBALL_NAME}-${WEB_SERVER_IP}-${DATE_AND_TIME}.txz"
declare -r FULL_DBDUMP_NAME="${DATABASE_NAME}-${WEB_SERVER_IP}-${DATE_AND_TIME}.sql"

declare -r FTP_SERVER_IP="192.168.0.FTP"

backup_store_dir=/var/local/redmine/
redmine_full_path=/opt/redmine-5.0.2
db_username=root
db_password=<dbpassword>

mkdir -p ${backup_store_dir}

# Redmine backup.
if [ -d ${redmine_full_path} ]; then
    tar -cJf ${backup_store_dir}${FULL_TARBALL_NAME} ${redmine_full_path}
fi

# Database backup.
mysqldump -u${db_username} -p${db_password} ${DATABASE_NAME} > ${backup_store_dir}${FULL_DBDUMP_NAME} && \
xz                                                             ${backup_store_dir}${FULL_DBDUMP_NAME}

# FTP-ing all the backups.
# Note: See the ~/.netrc config for actual FTP commands to do the job.
#ftp -p ${FTP_SERVER_IP}

# --- Payload - End -----------------------------------------------------------

# If there is an error -- telling the OS about this.
if [ $? -eq ${EXIT_FAILURE} ]; then
    exit    ${EXIT_FAILURE}
fi

exit        ${EXIT_SUCCESS}

# vim:set nu et ts=4 sw=4:
