#!/usr/bin/bash
### fully_update.sh ###
### Ryan Gilluley ###

# Variables
logFile="/var/log/updateLog.txt"
countLogs="$(wc -l < $logFile)"
dateF=`date +"%d/%m/%y %T"`

# Update the Maximum number of lines in the log file
maxLogs=40

function fully_update () {
    apt-get update && \
    apt-get upgrade -y && \
    apt-get dist-upgrade -y && \
    apt-get autoremove -y && \
    apt-get autoclean -y && \
    echo "Update Successful - $dateF" >> $logFile || \
    echo "Update Failed - $dateF" >> $logFile 
}

# Check if logfile already exists and creates it if it doesn't already exist
if [ ! $logFile ]
then
    touch $logFile 
fi

# Deletes oldest line until the number of lines in the log file matches that of $maxLogs variable
if [ $countLogs -gt $maxLogs ]
then
    echo "Maximum number of logs reached - Deleting oldest line"
    while [ $(wc -l < $logFile ) -gt $maxLogs ]
    do
        sed -i '1d' $logFile
    done
    fully_update
else
    fully_update
fi
