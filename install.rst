
System aktualisiern:

.. code:: bash

  sudo apt-get update
  sudo apt-get upgrade

Python3 und den installer für Python3-Packages installieren:

.. code:: bash

  sudo apt-get install python3
  sudo apt-get install python3-pip

Python packages für mongoDB und für zmq-sockets installieren:

.. code:: bash

  pip3 install pymongo
  pip3 install pyzmq

nodeJS und den node package manager installieren (über node oder nodejs, Distrobutionsabhängig):

.. code:: bash

  sudo apt-get install node npm

oder

.. code:: bash

  sudo apt-get install nodejs npm

nodeJS package zum besseren Starten von Scripten installieren:

.. code:: bash

  sudo npm install -g nodemon

Quellcode als gitrepsoitory runterladen und installieren:

.. code:: bash

  git clone https://github.com/knuella/cook
  cd cook
  git submodule init
  git submodule update
  
  cd visu
  npm install python=python2

Programm starten / stoppen:

.. code:: bash

  cd cook

  #start:
  ./start.sh
  #stop:
  ./stop.sh

Update:

.. code:: bash

  cd cook
  git pull
  git submodules update
  
  cd visu
  npm install python=python2

