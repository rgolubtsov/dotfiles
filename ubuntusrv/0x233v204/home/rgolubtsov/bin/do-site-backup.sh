#!/usr/bin/env bash
# ~/bin/do-site-backup.sh
# =============================================================================
# This script performs a complete backup of the whole Joomla! website
# along with its corresponding database, and uploads those tarballs
# to the FTP server.
# =============================================================================
# Written by Radislav (Radicchio) Golubtsov, 2021-2023
#

# Helper constants.
declare -r EXIT_FAILURE=1 #    Failing exit status.
declare -r EXIT_SUCCESS=0 # Successful exit status.

# --- Payload - Begin ---------------------------------------------------------

declare -r  TARBALL_NAME="x-abcd-joomla3"
declare -r DATABASE_NAME="xabcdjoomla3db"
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

backup_store_dir=/tmp/abcd/
cms_full_path=/var/www/x-abcd-joomla3
db_username=root
db_password=<dbpassword>

mkdir -p ${backup_store_dir}

# Joomla! backup.
if [ -d ${cms_full_path} ]; then
    tar -cJf ${backup_store_dir}${FULL_TARBALL_NAME} ${cms_full_path}
fi

# Database backup.
mysqldump -u${db_username} -p${db_password} ${DATABASE_NAME} > ${backup_store_dir}${FULL_DBDUMP_NAME} && \
xz                                                             ${backup_store_dir}${FULL_DBDUMP_NAME}

# FTP-ing all the backups.
# Note: See the ~/.netrc config for actual FTP commands to do the job.
pftp ${FTP_SERVER_IP}

# --- Payload - End -----------------------------------------------------------

# If there is an error -- telling the OS about this.
if [ $? -eq ${EXIT_FAILURE} ]; then
    exit    ${EXIT_FAILURE}
fi

exit        ${EXIT_SUCCESS}

# vim:set nu et ts=4 sw=4:
