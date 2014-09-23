
if [ -f mb.pid -o -f cm.pid -o -f tm.pid -o -f visu.pid -o -f digital_output.pid -o -f analog_output.pid -o -f digital_input.pid ]
then
	echo "Is the process already startet? If not remove the *.pid files manually."
else
	path=$PWD

	cd $path/base/src
	python3 message_broker.py&
	echo $! > $path/mb.pid
	sleep 5
	python3 configuration_manager_mongodb.py cm tcp://127.0.0.10:6666 tcp://127.0.0.10:6665 tcp://127.0.0.10:5556 tcp://127.0.0.10:5555&
	echo $! > $path/cm.pid
	sleep 5
	python3 template_manager.py tm tcp://127.0.0.10:6666 tcp://127.0.0.10:6665 tcp://127.0.0.10:5556 tcp://127.0.0.10:5555&
	echo $! > $path/tm.pid
	sleep 5

	cd $path/apps/src
	python2 datapoint_output/output_gnublin_relay.py digital_output tcp://127.0.0.10:6666 tcp://127.0.0.10:6665 tcp://127.0.0.10:5556 tcp://127.0.0.10:5555&
	echo $! > $path/digital_output.pid
	python2 datapoint_output/output_gnublin_dac.py analog_output tcp://127.0.0.10:6666 tcp://127.0.0.10:6665 tcp://127.0.0.10:5556 tcp://127.0.0.10:5555&
	echo $! > $path/analog_output.pid
	python3 datapoint_input/input_gpio_digital.py digital_input tcp://127.0.0.10:6666 tcp://127.0.0.10:6665 tcp://127.0.0.10:5556 tcp://127.0.0.10:5555&
	echo $! > $path/digital_input.pid
	
	#cd $path/visu
	#node index.js&
	#echo $! > $path/visu.pid
fi
