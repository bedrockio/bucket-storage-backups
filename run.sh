#!/bin/bash

SOURCE_GS_BUCKET=`cat /workdir/SOURCE_GS_BUCKET.env`
DESTINATION_GS_BUCKET=`cat /workdir/DESTINATION_GS_BUCKET.env`
DATE_STR=`date +%Y-%m-%d-%H-%M`

cd /workdir

echo $DATE_STR > /workdir/backup.date
gsutil -m cp -r gs://$SOURCE_GS_BUCKET gs://$DESTINATION_GS_BUCKET
if [ $? -ne 0 ]; then
    echo "Error copying file(s) to backup Google storage bucket!!"
    exit 1
fi
gsutil cp /workdir/backup.date gs://$DESTINATION_GS_BUCKET
if [ $? -ne 0 ]; then
    echo "Error copying backup date marker to Google storage bucket!!"
    exit 1
fi
