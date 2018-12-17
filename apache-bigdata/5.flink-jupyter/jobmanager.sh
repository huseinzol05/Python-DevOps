echo "Starting Job Manager"
sed -i -e "s/jobmanager.rpc.address: localhost/jobmanager.rpc.address: ${JOB_MANAGER_RPC_ADDRESS}/g" "$FLINK_HOME/conf/flink-conf.yaml"
echo "blob.server.port: 6124" >> "$FLINK_HOME/conf/flink-conf.yaml"
echo "query.server.port: 6125" >> "$FLINK_HOME/conf/flink-conf.yaml"
echo "config file: " && grep '^[^\n#]' "$FLINK_HOME/conf/flink-conf.yaml"
$FLINK_HOME/bin/jobmanager.sh start
