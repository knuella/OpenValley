#!/bin/bash
if [ "$1" == "start" ]; then
  mkdir -p db &&
  mongod --dbpath ./db --repair --repairpath ./db  &&
  mongod --dbpath ./db --fork --logpath ./db/mongodb.log
elif [ "$1" == "stop" ]; then
  mongod --dbpath ./db --shutdown
fi
