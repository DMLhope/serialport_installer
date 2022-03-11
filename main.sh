#!/bin/env bash
main(){
	if [ -f /run/live/medium/serialport_installer.sh ];then
		bash /run/live/medium/serialport_installer.sh
	else
    	bash /usr/bin/serialport_installer.sh
	fi
}

main