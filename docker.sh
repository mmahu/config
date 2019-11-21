#!/bin/sh
if [ -z "$DEVTOOL"]; then
    java -jar -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap $JAVA_OPTS /usr/src/app/$(ls /usr/src/app | grep jar)
else
    java -jar -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap $JAVA_OPTS /usr/src/app/$(ls /usr/src/app | grep jar) --spring.config.location=/application.yml
fi