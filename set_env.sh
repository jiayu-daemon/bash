#!/bin/bash
# Author:itxx00@gmail.com
#write by jiayu
# Set environment
# CardReader and NRL-Hr200
if [ -f "/etc/udev/rules.d/99-mydev.rules" ];then
    echo "rules mydev.rules already exist"
else
    echo "create mydev.rules"
    echo "KERNEL == \"udp0\",MODE=\"0666\"" >>  /etc/udev/rules.d/99-mydev.rules
    echo "KERNEL == \"ttyUSB0\",MODE=\"0666\"" >> /etc/udev/rules.d/99-mydev.rules
    echo "KERNEL == \"ttyUSB1\",MODE=\"0666\"" >> /etc/udev/rules.d/99-mydev.rules
    echo "KERNEL == \"ttyUSB2\",MODE=\"0666\"" >> /etc/udev/rules.d/99-mydev.rules
    echo "KERNEL == \"ttyUSB3\",MODE=\"0666\"" >> /etc/udev/rules.d/99-mydev.rules
    path=$(uname -r)
    echo $path
    cp usb_datapipe.ko /lib/modules/$path

    data1="/sbin/insmod /lib/modules/"
    data2="/usb_datapipe.ko"
    date3=${data1}${path}${data2}
    echo $date3

    echo "add start boot driver"
    #del origin data
    sed -i '/exec/d' /etc/init.d/rcS
    #add new data
    echo $date3 >> /etc/init.d/rcS
    #add origin data
    echo "exec /etc/init.d/rc S" >> /etc/init.d/rcS
fi