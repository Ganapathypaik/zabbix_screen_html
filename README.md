# We have used zabbix as a monitoring tool for Performance monitoring during our load test , and at the end of the load test 
# we would require a report to show cast the metrics collected  as a part of final report.

# The output of the script will give us an html file with all the metrics monitored on a particular screen.

# The below script will work only with Zabbix UI authentication disabled.


# The below code would work for zabbix deployed on "IP":"PORT"

# Sample url for reference
# http://"IP":"PORT"/zabbix/screens.php?elementid=29&fullscreen=0&period=1800&stime=201810032332500&isNow=0

# usage: ./Zabbix_html_screen_generation.sh 20181003233250 29 1800 192.XXX.XXX.XX 8080

# Start Time : expanded "2018 10 03 23 32 50" - Year Month Date Hour Minutes Seconds , need to be given without spaces.

# Screen Id [elementid]: Get The Same from Zabbix UI

# Period : Duration of the load test in seconds 1800 - 30 mins

# IP :  192.XXX.XXX.XX  , Zabbix controller Ip

# Port : 8080 , Zabbix Controller Port
