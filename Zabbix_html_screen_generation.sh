# Sample url for reference
# The below code would work for zabbix deployed on "IP":"PORT"
# http://"IP":"PORT"/zabbix/screens.php?elementid=29&fullscreen=0&period=1800&stime=201810032332500&isNow=0
# usage: ./Screen_Graphs_Generate.sh 20181003233250 29 1800
# Start Time : expanded "2018 10 03 23 32 50" - Year Month Date Hour Minutes Seconds , need to be given without spaces.
# Screen Id : Get The Same from Zabbix UI
# Period : Duration of the load test in seconds 1800 - 30 mins
# The below script will work only with Zabbix UI authentication disabled.

# Remove all the old graphs 

rm -rf Graphs

# Input the Start time 

stime=$1

# Input the Screen Id

screenid=$2

# Input the time in seconds for the duration of the test run

period=$3

# Input the 
 

IP=$4


# Input the Port 

port=$5

#Generating URL for the zabbix Screen

url=`echo "http://""$IP"":""$port""/zabbix/screens.php?elementid=""$screenid""&fullscreen=0&period=""$period""&stime=""$stime""&isNow=0"`

# wget the url to get the Graph Ids

wget "$url" -O delme_wget

# generate the graph url for the specified time

echo""
	for i in `grep graphid delme_wget | grep href | sed 's/href/\n/g' | grep -v Filter | cut -d\> -f1 | cut -d? -f2 | cut -d\& -f1`
		do
			graph_url=`echo "http://""$IP"":""$port""/zabbix/chart2.php?""$i""&screenid=""$screenid""&width=500&height=100&legend=1&profileIdx=web.screens&profileIdx2=""$screenid""&period=""$period""&stime=""$stime""&isNow=0"`
			wget -r -p --convert-links -H ""$graph_url""
		done

# Remove the temperory processing file

rm -rf delme_wget 
		
# rename the wget output directory to Graphs 		

mv "$IP"\:"$port"/ Graphs
					
# Generate the html output 
					
echo "<!DOCTYPE html><html><body>" > Sample.html

# Find the path for the actual graphs

path=`find . -name zabbix`

	for i in `ls $path`
		do
			echo "<img src=\""$path'/'$i "\" >" >> Sample.html
		done
		
echo "</body></html>" >> Sample.html

# End of the html report Generation

# Final sed to make sure the graphs are visible in html output.

sed -i 's/php?/php%3F/g' Sample.html
