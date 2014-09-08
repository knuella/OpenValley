
if [ -f mb.pid -o -f cm.pid -o -f tm.pid -o -f visu.pid ]
then
	echo "Is the process already startet? if not remove the .pid files manually."
else
	cd backend/src
	python3 message_broker.py&
	echo $! > ../../mb.pid
	python3 configuration_manager_mongodb_alt.py cm tcp://127.0.0.10:6666 tcp://127.0.0.10:6665 tcp://127.0.0.10:5556 tcp://127.0.0.10:5555&
	echo $! > ../../cm.pid
	python3 template_manager.py tm tcp://127.0.0.10:6666 tcp://127.0.0.10:6665 tcp://127.0.0.10:5556 tcp://127.0.0.10:5555&
	echo $! > ../../tm.pid
	
	cd ../../visu
	node index.js&
	echo $! > ../visu.pid
fi
