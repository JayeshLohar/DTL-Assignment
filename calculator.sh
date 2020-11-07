# Calculator

# Name     : Jayesh Bapu Gadilohar
# MIS      : 111910048
# Division : 2
# Batch    : S4

#!/bin/bash

echo -e "==================== MENU ====================\n"

    echo " 1 : Addition "
    echo " 2 : Subtraction "
    echo " 3 : Multiplication "
    echo " 4 : Division "
    echo " 5 : Modulus "
    echo " 6 : Quit "

while true
do
    echo -e "\n==============================================\n"
    echo -n "Enter your choice : "
    read ch

    if [ $ch == 6 ]
    then
    echo "Quitting...!!"
        exit 0
    fi
    echo -n "Enter 1st no. : "
    read a
    echo -n "Enter 2nd no. : "
    read b

    echo " "
    case $ch in
        1) res=`expr $a + $b`
            echo "Addition of $a and $b is : $res" ;;
        2) res=`expr $a - $b`
            echo "Subtraction of $a and $b is : $res" ;;
        3) res=`expr $a \* $b`
            echo "Multiplition of $a and $b is : $res" ;;
        4) res=`expr $a / $b`
            echo "Quotient of $a and $b : $res" ;;
        5) res=`expr $a % $b`
            echo "Modulus of $a and $b is : $res" ;;
        *) echo "Invalid Option...!!" ;;
    
    esac
done