#!/bin/sh
. ./lib/sh/df.rc

case $1 in
	root)
		fdf root
	;;
	libs)
		fdf
	;;
esac

exit 0
