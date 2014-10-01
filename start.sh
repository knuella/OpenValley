
if [ -f mb.pid -o -f cm.pid -o -f tm.pid -o -f visu.pid -o -f digital_output.pid -o -f analog_output.pid -o -f digital_input.pid -o -f 0x20_1.pid -o -f 0x20_2.pid -o -f 0x20_3.pid -o -f 0x20_4.pid -o -f gpio_7.pid -o -f gpio_11.pid -o -f gpio_12.pid -o -f gpio_13.pid ]
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
	sudo python3 datapoint_input/input_gpio_digital.py digital_input tcp://127.0.0.10:6666 tcp://127.0.0.10:6665 tcp://127.0.0.10:5556 tcp://127.0.0.10:5555&
	echo $! > $path/digital_input.pid
	
	python2 datapoint_output/output_gnublin_relay_0x20_1.py 0x20_1 tcp://127.0.0.10:6666 tcp://127.0.0.10:6665 tcp://127.0.0.10:5556 tcp://127.0.0.10:5555&
	echo $! > $path/0x20_1.pid
	python2 datapoint_output/output_gnublin_relay_0x20_2.py 0x20_2 tcp://127.0.0.10:6666 tcp://127.0.0.10:6665 tcp://127.0.0.10:5556 tcp://127.0.0.10:5555&
	echo $! > $path/0x20_2.pid
	python2 datapoint_output/output_gnublin_relay_0x20_3.py 0x20_3 tcp://127.0.0.10:6666 tcp://127.0.0.10:6665 tcp://127.0.0.10:5556 tcp://127.0.0.10:5555&
	echo $! > $path/0x20_3.pid
	python2 datapoint_output/output_gnublin_relay_0x20_4.py 0x20_4 tcp://127.0.0.10:6666 tcp://127.0.0.10:6665 tcp://127.0.0.10:5556 tcp://127.0.0.10:5555&
	echo $! > $path/0x20_4.pid
	
	
	sudo python3 datapoint_input/input_gpio_digital_7.py gpio_7 tcp://127.0.0.10:6666 tcp://127.0.0.10:6665 tcp://127.0.0.10:5556 tcp://127.0.0.10:5555&
	echo $! > $path/gpio_7.pid
	sudo python3 datapoint_input/input_gpio_digital_11.py gpio_11 tcp://127.0.0.10:6666 tcp://127.0.0.10:6665 tcp://127.0.0.10:5556 tcp://127.0.0.10:5555&
	echo $! > $path/gpio_11.pid
	sudo python3 datapoint_input/input_gpio_digital_12.py gpio_12 tcp://127.0.0.10:6666 tcp://127.0.0.10:6665 tcp://127.0.0.10:5556 tcp://127.0.0.10:5555&
	echo $! > $path/gpio_12.pid
	sudo python3 datapoint_input/input_gpio_digital_13.py gpio_13 tcp://127.0.0.10:6666 tcp://127.0.0.10:6665 tcp://127.0.0.10:5556 tcp://127.0.0.10:5555&
	echo $! > $path/gpio_13.pid
	
	#cd $path/visu
	#node index.js&
	#echo $! > $path/visu.pid
fi
