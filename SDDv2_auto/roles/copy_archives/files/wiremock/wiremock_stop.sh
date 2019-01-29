PID=`ps -ef | grep 8083 | grep "wiremock-standalone.jar" | awk -F" " '{ print $2 }'`
rougefonce='\e[0;31m'
neutre='\e[0;m'
if [ $PID ]
then
  kill -9 $PID
  echo -e "le Wiremock it's ${rougefonce}DOWN${neutre} ";
else
   echo -e "le Wiremock it ${rougefonce}WAS DOWN${neutre} ";
fi

