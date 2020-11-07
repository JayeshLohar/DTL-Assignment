# Text file to csv file

# Name     : Jayesh Bapu Gadilohar
# MIS      : 111910048
# Division : 2
# Batch    : S4

#!/bin/bash

echo "Method,Url,User-Agent,Pragma,Cache-Control,Accept,Accept-Encoding,Accept-Charset,Accept-Language,Host,Cookie,Content-Type,Connection,Content-Length" >> Output.csv # Headings of the columns

count=0

read -p "Enter the name of the file : " fileName # accepting the file name as input

while read line # reading the text file line by line
do
	if [ `printf "%d" "'$line'"` -eq 13 ] # if newline is encountered (ASCII value is 13) then just ignore it 
	then
		continue
	fi

	if [ "${line:0:2}" == "id" ] || [ "${line:0:4}" == "modo" ] || [ "${line:0:8}" == "errorMsg" ] || [ "${line:0:2}" == "B2" ]
	then
		continue
	fi

	if [ $count -eq 0 ] # if it is the first line of every record then check whether method is GET or POST
	then
		if [ "${line:0:3}" == "GET" ] # if method is GET
		then
			echo -n "GET," >> Output.csv  
			echo -n "\"""${line:4:${#line}}""\"," >> Output.csv # the url is sent to output file 
		       		# "\"" is used to append double quotes at the end and beginning so that data can contain commas 	
			flag=1 # set the flag to 1

		elif [ "${line:0:4}" == "POST" ] # if the method is POST
		then 
			echo -n "POST," >> Output.csv
			echo -n "\"""${line:5:${#line}}""\"," >> Output.csv # the url is sent to output file 
			flag=2 # set the flag to 2 
		fi
		((count++))
		
	else # if it is not the first line of the record 
		if [ $flag -eq 1 ] # if the method is GET
		then
			if [ $count -eq 10 ] # when count becomes 10 then we get the last line of the record which has method GET 
			then
				echo -n "\"""${line#*:}""\"," >> Output.csv # -n flag is used to keep the cursor on the same line
				echo "\"""\"" >> Output.csv # This blank column has to be added because the POST method has one extra last column
				count=0 # setting the count to 0 for reading next data

			elif [ $count -eq 9 ] # if count is 9 then another blank space has to be left in the GET method
			then
				echo -n "\"""${line#*:}""\"," >> Output.csv 
				echo -n "\"""\"""," >> Output.csv # blank column
				((count++))
				
			else
				echo -n "\"""${line#*:}""\"," >> Output.csv
				((count++))
			fi

		elif [ $flag -eq 2 ] # if the method is POST 
		then
			if [ $count -eq 12 ] # when count becomes 12 then we get the last line of the record which has method GET
			then
				echo  "\"""${line#*:}""\"" >> Output.csv
				count=0
			else
				echo -n "\"""${line#*:}""\"," >> Output.csv
				((count++))			
			fi

		fi	
	fi
done < $fileName
