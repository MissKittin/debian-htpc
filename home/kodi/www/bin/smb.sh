#!/bin/sh
. ./lib/sh/library.rc

cat /etc/samba/smb.conf |
	grep -v '#' |
	grep -v '$]' |
	grep -v global |
	grep -v homes |
	grep -v print |
	grep -v root |
	grep '\[' |
	sed -e 's/\[/ /g' |
	sed -e 's/\]/ /g' |
	xargs | $NO_NEWLINE

exit 0
