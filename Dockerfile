FROM maven:3.6.3-openjdk-17

RUN mkdir job4j_tracker

WORKDIR job4j_tracker

COPY . .

ARG JDBC_URL

RUN mvn liquibase:update -Pdocker -DJDBC_URL=$JDBC_URL

RUN mvn package -Dmaven.test.skip=true

CMD ["java", "-jar", "target/tracker.jar"]