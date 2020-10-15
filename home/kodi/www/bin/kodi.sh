#!/bin/bash
. ./lib/sh/kodi.rc

case $1 in
	version)
		version
	;;
	time)
		ftime
	;;
	run)
		frun
	;;
esac

exit 0
