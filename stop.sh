#!/usr/bin/bash
pidfiles="mb.pid cm.pid tm.pid visu.pid digital_output.pid analog_output.pid digital_input.pid 0x20_1.pid 0x20_2.pid 0x20_3.pid 0x20_4.pid gpio_7.pid gpio_11.pid gpio_12.pid gpio_13.pid"

for pidfile in $pidfiles
do
	pid=`tail $pidfile` &&
	kill $pid &&
	rm $pidfile
done
