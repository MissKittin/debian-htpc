#!/bin/sh

### ALWAYS USE WITH resume ARGUMENT!!!

LOG='/tmp/.pm_set-standby.log'
mountpoint -q /tmp || LOG='/dev/null'
case $1 in
	resume)
		for i in `ls /dev/sd?`; do
			#hdparm -S `cat /etc/rc.local | grep 'hdparm -S' | awk '{print $3}'` $i > /dev/null 2>&1
			hdparm -S `cat /usr/local/etc/hdparm/standby` $i >> $LOG 2>&1
		done

	;;
esac