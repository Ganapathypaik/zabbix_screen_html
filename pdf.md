# If we have disabled the zabbix ui authentication. we can smply follow the below to get the pdf zabbix screen report .
# on Centos 7
# Command -------- sudo yum install Xvfb --------( Capital X)
# Command -------- sudo yum install  wkhtmltopdf --------------
# 
# Final Command Below
# 
# 
# xvfb-run /usr/bin/wkhtmltopdf "http://IP:PORT/zabbix/screens.php?elementid=40&period=3600&stime=20181112090727&isNow=0"  screenPdf.pdf
# where stime=20181112090727 is start time - 2018 11 12 09 07 27 - Year Month Date Hour Mins Seconds
# period=3600 , its the duration , in this example 1 hour
# isNow=0 , needs to be kept for old time periods
# elementid is the screen id , got from the screen page , for the screen you intending to capture the pdf .
# output will be screenPdf.pdf , a pdf containing the zabbix screen.










