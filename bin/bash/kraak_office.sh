#!/bin/bash
echo -n 'Kraak office? [j/n] '
read -n1 ja
echo
if [ $ja == 'j' ]
then
	if cp c:/soft/mso.dll c:/program\ files/common\ files/microsoft\ shared/Office10 2>/dev/null
	then
		echo -n 'Office is gekraakd, druk op een toets...'
		read -n1
	else
		echo -n 'Office is NIET gekraakd (misschien staat word, ofzo, nog open), 
druk op een toets...'
		read -n1
	fi
else
	echo -n 'Oke dan kraak ik em toch niet hé, druk op een toets...'
	read -n1
fi

