#!/usr/bin/bash
pidfiles="tm.pid cm.pid mb.pid output.pid input.pid"

for pidfile in $pidfiles
do
	pid=`tail $pidfile` &&
	kill $pid &&
	rm $pidfile
done
