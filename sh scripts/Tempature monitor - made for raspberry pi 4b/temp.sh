#temp for 5 minutes then ask to continue

##plans for future editions##
# 1) make the output look pretty
# 2) allow user to set the durration of tempature monitoring

#variables
declare -i q=0 #counter for how many times it has gone 5 seconds
declare -i s=60 #"s" is the veriable of when to stop to ask
temp="Tempature isn't reading from file!"
input="/sys/class/thermal/thermal_zone0/temp"

#infinante loop to run tempature check
#echo -n "How many seconds do you wish to monitor your tempature? (1=60, 2=120, 3=180. 4=240, 5=300, and so on.): "
#read ss


while true
do
	#check if time has hit 5 minutes
	if [ $q -eq $s ] 
	then
		echo -n "Do you want to continue checking the tempature? (y/n):"
		read responce
		
		#quit program or keep running
		if [ "$responce" = "n" ]
		then
			exit
		elif  [ "$responce" = "y" ]
		then
			q=0
			continue
		else
			echo "Please enter a 'y' or 'n'!"
		fi

	else #keeps printing tempature
		temp=$(cat $input)
		#echo -ne " -------------\n| temp: $temp |\n -------------"\\r
		echo -ne "Current Tempature: $temp"\\r
		q=$q+1
		sleep 1 #wait secon between print outs
	fi
done
