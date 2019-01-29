java -jar wiremock-standalone.jar --verbose --port 8083 > Wiremock.log 2>&1 &

PID=`ps -ef | grep 8083 | grep "wiremock-standalone.jar" | awk -F" " '{ print $2 }'`
neutre='\e[0;m'
vert='\e[1;32m'
if [[ $PID ]]
then
   echo -e "le Wiremock it's ${vert}UP${neutre}";
fi

