## Alter queues for Broker Queue manager

## Check that the script has been called correctly.
if [[ "$#" = 0 || "$1" = '-?' || "$1" = '?' || "$1" = '-help' || "$1" = 'help' ]]; then
     echo " "
     echo "DELETE queues: Please supply target queue manager name"
     echo " "
     exit 0
fi

qmgr=$1
CENV='echo $qmgr | cut -c-2'

echo " "
echo "Removing temporary file"
echo " "
rm tmp_mqs_script.mqsc
touch tmp_mqs_script.mqsc
chmod 777 tmp_mqs_script.mqsc
echo " "
echo "Defining queues for queue manager" $qmgr 
echo " "
echo " " >> tmp_mqs_script.mqsc
echo "DELETE QA('DP.SIV.COMMCODES') -" >> tmp_mqs_script.mqsc
echo "        AUTHREC(YES)" >> tmp_mqs_script.mqsc
echo " " >> tmp_mqs_script.mqsc
echo "END" >> tmp_mqs_script.mqsc
runmqsc $qmgr <tmp_mqs_script.mqsc