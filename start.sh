
if [ -f mb.pid -o -f cm.pid -o -f tm.pid -o -f visu.pid ]
then
	echo "Is the process already startet? if not remove the .pid files manually."
else
	path=$PWD
	cd base/src
	python3 message_broker.py&
	echo $! > $path/mb.pid
	python3 configuration_manager_mongodb_alt.py cm tcp://127.0.0.10:6666 tcp://127.0.0.10:6665 tcp://127.0.0.10:5556 tcp://127.0.0.10:5555&
	echo $! > $path/cm.pid
	python3 template_manager.py tm tcp://127.0.0.10:6666 tcp://127.0.0.10:6665 tcp://127.0.0.10:5556 tcp://127.0.0.10:5555&
	echo $! > $path/tm.pid
	python3 output.py output tcp://127.0.0.10:6666 tcp://127.0.0.10:6665 tcp://127.0.0.10:5556 tcp://127.0.0.10:5555&
	echo $! > $path/output.pid
	python3 input.py input tcp://127.0.0.10:6666 tcp://127.0.0.10:6665 tcp://127.0.0.10:5556 tcp://127.0.0.10:5555&
	echo $! > $path/input.pid
	
	#cd $path/visu
	#node index.js&
	#echo $! > $path/visu.pid
fi
