#!/bin/bash
# Author:itxx00@gmail.com
#write by jiayu
if [ -f "/etc/udev/rules.d/99-mydev.rules" ];then
    echo "rules mydev.rules already exist"
else
    echo "create mydev.rules"
    echo "KERNEL == \"udp0\",MODE=\"0666\"" >>  /etc/udev/rules.d/99-mydev.rules
fi

echo "copy ko file to lib dir"
echo `uname -r`
#cp usb_datapipe.ko /lib/modules/$(KERNEL_PATH)

echo "add start boot driver"
