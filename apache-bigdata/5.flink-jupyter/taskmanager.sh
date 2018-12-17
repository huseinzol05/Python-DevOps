TASK_MANAGER_NUMBER_OF_TASK_SLOTS=${TASK_MANAGER_NUMBER_OF_TASK_SLOTS:-$(grep -c ^processor /proc/cpuinfo)}
sed -i -e "s/jobmanager.rpc.address: localhost/jobmanager.rpc.address: ${JOB_MANAGER_RPC_ADDRESS}/g" "$FLINK_HOME/conf/flink-conf.yaml"
sed -i -e "s/taskmanager.numberOfTaskSlots: 1/taskmanager.numberOfTaskSlots: $TASK_MANAGER_NUMBER_OF_TASK_SLOTS/g" "$FLINK_HOME/conf/flink-conf.yaml"
echo "blob.server.port: 6124" >> "$FLINK_HOME/conf/flink-conf.yaml"
echo "query.server.port: 6125" >> "$FLINK_HOME/conf/flink-conf.yaml"
echo "Starting Task Manager"
echo "config file: " && grep '^[^\n#]' "$FLINK_HOME/conf/flink-conf.yaml"
$FLINK_HOME/bin/taskmanager.sh start
