if [ "$#" -ne 2 ]; then
  echo -e "Usage: ch11.sh \$SOLR_IN_ACTION \$SOLR_INSTALL"
  exit 0
fi
SOLR_IN_ACTION=${1%/}
SOLR_INSTALL=${2%/}
for ID in `ps waux | grep java | grep [s]tart.jar | awk '{print $2}' | sort -r`
  do
    kill -9 $ID
    echo "Killed previous Solr process: $ID"
done #stops Solr if running from previous chapter
sleep 2 #give processes time to die
echo -e "----------------------------------------\n"
echo -e "CHAPTER 11"
echo -e "----------------------------------------\n"
echo -e "\n\n"
echo -e "pg 333"
echo -e "\n"
cd $SOLR_INSTALL/example/
cp -r $SOLR_IN_ACTION/example-docs/ch11/cores/ecommerce/ solr/ecommerce/
echo -e "Starting Solr example server on port 8983; see $SOLR_INSTALL/example/solr.log for errors and log messages"
java -jar start.jar 1>solr.log 2>&1 &
sleep 10 #give Solr time to start
cd $SOLR_IN_ACTION/example-docs/
java -Durl=http://localhost:8983/solr/ecommerce/update -jar post.jar ch11/documents/ecommerce.xml
echo -e "\n"
echo -e "pg 333"
echo -e "\n"
java -jar $SOLR_IN_ACTION/solr-in-action.jar listing 11.3
echo -e "\n"
echo -e "pg 336"
echo -e "\n"
java -jar $SOLR_IN_ACTION/solr-in-action.jar listing 11.4
echo -e "\n"
echo -e "pg 338"
echo -e "\n"
java -jar $SOLR_IN_ACTION/solr-in-action.jar listing 11.5
echo -e "\n"
echo -e "pg 340"
echo -e "\n"
java -jar $SOLR_IN_ACTION/solr-in-action.jar listing 11.6
echo -e "\n"
echo -e "pg 343"
echo -e "\n"
java -jar $SOLR_IN_ACTION/solr-in-action.jar listing 11.7
echo -e "\n"
echo -e "pg 345"
echo -e "\n"
java -jar $SOLR_IN_ACTION/solr-in-action.jar listing 11.8
echo -e "\n"
echo -e "pg 349"
echo -e "\n"
java -jar $SOLR_IN_ACTION/solr-in-action.jar listing 11.9
echo -e "\n"
echo -e "pg 351"
echo -e "\n"
java -jar $SOLR_IN_ACTION/solr-in-action.jar listing 11.10