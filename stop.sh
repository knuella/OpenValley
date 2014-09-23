#!/usr/bin/bash
pidfiles="mb.pid cm.pid tm.pid visu.pid digital_output.pid analog_output.pid digital_input.pid"

for pidfile in $pidfiles
do
	pid=`tail $pidfile` &&
	kill $pid &&
	rm $pidfile
done
