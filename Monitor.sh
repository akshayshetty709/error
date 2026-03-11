#!/bin/bash

DATE=$(date +%F)
LOG_DIR="/home/ubuntu/log-automation-project/logs"
BACKUP_DIR="/home/ubuntu/log-automation-project/backup"
DISK_THRESHOLD=80
EMAIL="yourmail@gmail.com"

echo "Starting Backup Process..."

# Create backup
tar -czf $BACKUP_DIR/log-backup-$DATE.tar.gz $LOG_DIR

echo "Backup Completed: $BACKUP_DIR/log-backup-$DATE.tar.gz"

# Check disk usage
USAGE=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')

if [ $USAGE -gt $DISK_THRESHOLD ]
then
echo "Warning: Disk usage is above $DISK_THRESHOLD%" | mail -s "Disk Alert" $EMAIL
echo "Alert Sent!"
else
echo "Disk usage is normal"
fi
