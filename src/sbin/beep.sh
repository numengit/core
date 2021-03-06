#!/bin/sh

if [ -f /conf/config.xml ]; then
	BEEP=`/usr/bin/grep -c disablebeep /conf/config.xml`
	if [ $BEEP -gt 0 ]; then
		exit;
	fi
fi

# Standard note length
NOTELENGTH="25"

# Check for different HZ
if [ -f /boot/loader.conf ]; then
	HZ=`/usr/bin/grep -c kern.hz /boot/loader.conf`
	if [ "$HZ" = "1" ]; then
		NOTELENGTH="10"
	fi
fi

if [ -c "/dev/speaker" ]; then
		if [ "$1" = "start" ]; then
			/usr/local/bin/beep -p 500 $NOTELENGTH
			/usr/local/bin/beep -p 400 $NOTELENGTH
			/usr/local/bin/beep -p 600 $NOTELENGTH
			/usr/local/bin/beep -p 800 $NOTELENGTH
			/usr/local/bin/beep -p 800 $NOTELENGTH
		fi
		if [ "$1" = "stop" ]; then
			/usr/local/bin/beep -p 600 $NOTELENGTH
			/usr/local/bin/beep -p 800 $NOTELENGTH
			/usr/local/bin/beep -p 500 $NOTELENGTH
			/usr/local/bin/beep -p 400 $NOTELENGTH
			/usr/local/bin/beep -p 400 $NOTELENGTH
		fi
fi
