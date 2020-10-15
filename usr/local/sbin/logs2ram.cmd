#! /bin/sh

# Lock service
#exit 0

do_start() {
	# Pre-mount
	cd /var/log
	VARLOG_DIRS=`find . ! -path . -type d`
	for i in $VARLOG_DIRS; do
		VARLOG_DIR_STORE="$VARLOG_DIR_STORE\n$i `stat -c %a $i` `stat -c %u $i`:`stat -c %g $i`"
	done

	# Mount
	cd /var
	[ -e .log ] && mount -o bind /var/log /var/.log
	mount -t tmpfs log /var/log; chmod 755 /var/log

	# Post-mount
	cd /var/log
	touch btmp wtmp; chown root:utmp btmp wtmp; chmod 400 btmp; chmod 664 wtmp
	for i in $VARLOG_DIRS; do
		echo $VARLOG_DIR_STORE | while read y; do
			if [ "`echo $y | awk '{print $1}'`" = "$i" ]; then
				mkdir $i
				chmod `echo $y | awk '{print $2}'` $i
				chown `echo $y | awk '{print $3}'` $i
			fi
		done
	done
}

case "$1" in
	start)
		do_start
		exit 0
	;;
	*)
		echo "Usage: $0 start" >&2
		exit 3
	;;
esac

exit 0

########################################################

# Old program with all mess:
# ! /bin/sh

# Lock service
#exit 0

# DEPRECATED
#abrt() {
#	log_end_msg 1
#	exit 1
#}
do_start() {
	# Pre-mount
	cd /var/log
	VARLOG_DIRS=`find . ! -path . -type d`
	for i in $VARLOG_DIRS; do
		# Debug
		#echo "Directory: ${i#.\/} owner `stat -c %u $i` group `stat -c %g $i` perms `stat -c %a $i`"
		#exit 0

		# Store
		VARLOG_DIR_STORE="$VARLOG_DIR_STORE\n$i `stat -c %a $i` `stat -c %u $i`:`stat -c %g $i`"
	done

	# Mount
	cd /var
	[ -e .log ] && mount -o bind /var/log /var/.log
	mount -t tmpfs log /var/log; chmod 755 /var/log

	# Post-mount
	cd /var/log
	touch btmp wtmp; chown root:utmp btmp wtmp; chmod 400 btmp; chmod 664 wtmp
	for i in $VARLOG_DIRS; do
		echo $VARLOG_DIR_STORE | while read y; do
			if [ "`echo $y | awk '{print $1}'`" = "$i" ]; then
				mkdir $i
				chmod `echo $y | awk '{print $2}'` $i
				chown `echo $y | awk '{print $3}'` $i
			fi
		done
	done
}
# DEPRECATED
#do_stop() {
#	# Pre-unmount
#	cd /var/log
#	COMMANDS=`cat /var/log/.logs2ram`
#	VARLOG_DIRS=`find . ! -path . -type d`
#	for i in $VARLOG_DIRS; do
#		# Debug
#		#echo "Directory: ${i#.\/} owner `stat -c %u $i` group `stat -c %g $i` perms `stat -c %a $i`"
#
#		# Store
#		VARLOG_DIR_STORE="$VARLOG_DIR_STORE\n$i `stat -c %a $i` `stat -c %u $i`:`stat -c %g $i`"
#	done
#
#	# Unmount
#	cd /var
#	mountpoint /var/log > /dev/null 2>&1 && umount /var/log || abrt
#
#	# Post-unmount
#	cd /var/log
#	for i in $VARLOG_DIRS; do
#		echo $VARLOG_DIR_STORE | while read y; do
#			if [ "`echo $y | awk '{print $1}'`" = "$i" ]; then
#				if [ ! -e $i ]; then
#					mkdir $i
#					chmod `echo $y | awk '{print $2}'` $i
#					chown `echo $y | awk '{print $3}'` $i
#				fi
#			fi
#		done
#	done
#}

case "$1" in
	start)
		do_start
	;;
	stop)
		# DEPRECATED
		exit 0
		#log_begin_msg "Syncing logs directories"
		#do_stop
		#log_end_msg 0
	;;
	*)
		echo "Usage: $0 start|stop" >&2
		exit 3
	;;
esac

exit 0