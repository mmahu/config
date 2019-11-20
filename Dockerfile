FROM openjdk:8-jre-alpine
ADD /build/libs/config-0.0.1.jar config.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap MemEat","-jar","/config.jar"]