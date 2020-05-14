## Alter queues for MFT Queue manager

## Check that the script has been called correctly.
if [[ "$#" = 0 || "$1" = '-?' || "$1" = '?' || "$1" = '-help' || "$1" = 'help' ]]; then
     echo " "
     echo "Define queues: Please supply target queue manager name"
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
echo "DEFINE QL('DP.SIV.COMMCODES') -" >> tmp_mqs_script.mqsc
echo "       DESCR('COMMCODES Files Input Queue') - " >> tmp_mqs_script.mqsc
echo "       CLUSTER(MQC_L2ESB1) - " >> tmp_mqs_script.mqsc
echo "       BOQNAME(DP.SIV.COMMCODES.BAK) - " >> tmp_mqs_script.mqsc
echo "       DEFPSIST(YES) - " >> tmp_mqs_script.mqsc
echo "       DEFPRTY(0) - " >> tmp_mqs_script.mqsc
echo "       MAXDEPTH(5000) - " >> tmp_mqs_script.mqsc
echo "       MAXMSGL(4194304) - " >> tmp_mqs_script.mqsc
echo "       QDEPTHLO(20) - " >> tmp_mqs_script.mqsc
echo "       QDEPTHHI(80) - " >> tmp_mqs_script.mqsc
echo "       QDPMAXEV(ENABLED) - " >> tmp_mqs_script.mqsc
echo "       QDPHIEV(ENABLED) - " >> tmp_mqs_script.mqsc
echo "       QDPLOEV(DISABLED) - " >> tmp_mqs_script.mqsc
echo "       DEFBIND(NOTFIXED) - " >> tmp_mqs_script.mqsc
echo "       REPLACE" >> tmp_mqs_script.mqsc
echo " " >> tmp_mqs_script.mqsc
echo "DEFINE QL('DP.SIV.COMMCODES.BAK') -" >> tmp_mqs_script.mqsc
echo "       DESCR('COMMCODES Files Backout Queue') - " >> tmp_mqs_script.mqsc
echo "       CLUSTER(MQC_L2ESB1) - " >> tmp_mqs_script.mqsc
echo "       DEFPSIST(YES) - " >> tmp_mqs_script.mqsc
echo "       DEFPRTY(0) - " >> tmp_mqs_script.mqsc
echo "       MAXDEPTH(5000) - " >> tmp_mqs_script.mqsc
echo "       MAXMSGL(4194304) - " >> tmp_mqs_script.mqsc
echo "       QDEPTHLO(20) - " >> tmp_mqs_script.mqsc
echo "       QDEPTHHI(80) - " >> tmp_mqs_script.mqsc
echo "       QDPMAXEV(ENABLED) - " >> tmp_mqs_script.mqsc
echo "       QDPHIEV(ENABLED) - " >> tmp_mqs_script.mqsc
echo "       QDPLOEV(DISABLED) - " >> tmp_mqs_script.mqsc
echo "       DEFBIND(NOTFIXED) - " >> tmp_mqs_script.mqsc
echo "       REPLACE" >> tmp_mqs_script.mqsc
echo " " >> tmp_mqs_script.mqsc
echo "END" >> tmp_mqs_script.mqsc
runmqsc $qmgr <tmp_mqs_script.mqsc