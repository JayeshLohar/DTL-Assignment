# String Manipulation

# Name     : Jayesh Bapu Gadilohar
# MIS      : 111910048
# Division : 2
# Batch    : S4

#!/bin/bash

echo -e "==================== Menu ====================\n"

echo "1. Compare two strings"
echo "2. Concatenate two strings"
echo "3. Length of the string"
echo "4. Occurence of character"
echo "5. Reverse of string"
echo "6. Quit"

while true
do
    echo -e "\n=============================================="

        echo -e "\nEnter your choice : "
        read ch

        if [ $ch == 6 ]
        then
        echo "Quitting...!!"
            exit 0
        fi

        echo -e "\nEnter String : "
            read str1
        
	case $ch in
		1)  echo  "Enter 2nd String : "
		    read str2
		    if [ $str1 == $str2 ] 
		    then 
		   	echo $str1 " is equal to " $str2
		    else
			echo $str1 " is not equal to " $str2
		    fi
		;;

		2)  echo "Enter 2nd String : "
		    read str2
		    echo "Concatenation of two Strings is : "$str1$str2
		;;

		3)  echo "Length of the string is : "${#str1}
		;;

		4)  echo "Enter a charachter : "
		    read char
		    num=$(echo "${str1}" | awk -F"${char}" '{print NF-1}')
		    echo "'$char' occurs" ${num} "times"
		;;

		5)  for ((i = ${#str1} -1 ; i >= 0 ; i--))
            do
            reverse="$reverse${str1:$i:1}"
            done
		    echo "Reverse of string is : $reverse"
		;;

		*)  echo -e "\nError: Invalid option..."	
	        read -p "Press [Enter] key to continue..." readEnterKey
		;;
	esac
done