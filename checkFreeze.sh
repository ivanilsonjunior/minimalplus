#!/bin/bash
while :
	do
		
		ANT=$(tail -1 COOJA.testlog)
		if [[ $(tail -1 COOJA.testlog |grep ^Tes|wc -l) > 0 ]] ;then
			echo "Parece q terminou"
			sleep 10
			continue
		fi
		sleep 1
		NEW=$(tail -1 COOJA.testlog)
		if [[ "$ANT" == "$NEW" ]];then
			echo "Iguais: " $ANT 
			killall -HUP java
			sleep 10
		fi
	done
