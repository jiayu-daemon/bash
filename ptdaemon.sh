#!/bin/bash
while :
do
	ps |grep printer |grep -v grep |wc -l |while read line
	do
		#echo $line
		if [ "$line" == "0" ]; then
			echo "restart printer"
			/home/app/printer &
			sleep 2
			echo "sleep 2 wait"
			echo "check printer is valid"
			ps |grep printer |grep -v grep |wc -l |while read line
			do
				echo $line
				if [ "$line" == "0" ]; then
					echo "rename printerold"
					cp /home/app/printerold /home/app/printer
					break
				else 
					echo "restart ok"
					break
				fi	
			done
		else
			#echo "printer already running"
			:
		fi
	done
sleep 4
done
