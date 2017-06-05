#!/bin/bash
LED3_PATH=/sys/class/leds/beaglebone:green:usr3
## This function keeps the trigger to none which sets the LED3 to behave as per user customization.


function removeTrigger
{
	echo "none" > "$LED3_PATH/trigger"
}

# This function sets the LED3 to ON state.
function LED_on
{
	echo "1" > "$LED3_PATH/brightness"
}

# This function sets the LED3 to OFF state.
function LED_off
{
	echo "0" > "$LED3_PATH/brightness"
}

# This function sets the LED3 to flash state.
function LED_flash
{
	echo "timer" > "$LED3_PATH/trigger"
	echo "50" > "$LED3_PATH/delay_on"
	echo "50" > "$LED3_PATH/delay_off"
}

echo -e "Please follow example: ./shellBlinkLed3.sh on"
echo -e "\n arguments cane be one of these:\n1.on\n2.off\n3.flash\n4.status"
if [ $# != 1 ]; then
  echo " you have done something wrong wrt no of arguments."
  exit 2;
fi

if [ "$1" == "on" ]; then
	removeTrigger
	LED_on
elif [ "$1" == "off" ]; then
	removeTrigger
	LED_off
elif [ "$1" == "flash" ]; then
	removeTrigger
	LED_flash
elif [ "$1" == "status" ]; then
	cat $LED3_PATH/trigger
else
echo "\n wrong argument was sent by you"
#exit 0;
fi

sleep 4;
# resetting the LED3 
#echo "mmc1" > $LED_PATH/trigger
removeTrigger

