PID=`ps -ef | grep 8083 | grep "wiremock-standalone.jar" | awk -F" " '{ print $2 }'`
rougefonce='\e[0;31m'
neutre='\e[0;m'
vert='\e[1;32m'

if [ $PID ]
then
   echo -e  "le Wiremock it's ${vert}running${neutre}";
else
   echo -e "${rougefonce}le Wiremock it's DOWN, Please start the Wiremock${neutre}";
fi

