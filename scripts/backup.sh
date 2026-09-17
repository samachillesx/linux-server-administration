#!/bin/bash

BACKUP_DIR="/backups"
SOURCE="/etc/nginx"
DATE=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_FILE="$BACKUP_DIR/nginx_backup_$DATE.tar.gz"

sudo tar -czf "$BACKUP_FILE" "$SOURCE"

echo "Backup completed successfully."
echo "Backup file: $BACKUP_FILE"
