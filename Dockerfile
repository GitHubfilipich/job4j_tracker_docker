FROM maven:3.6.3-openjdk-17

RUN mkdir job4j_tracker

WORKDIR job4j_tracker

COPY . .

RUN mvn package -Dmaven.test.skip=true

ARG JDBC_URL
ARG JDBC_USERNAME
ARG JDBC_PASSWORD
ARG JDBC_DRIVER

RUN ["mvn", "liquibase:update", "-Pdocker", "-Djdbc_url=$JDBC_URL", "-Djdbc_username=$JDBC_USERNAME", "-Djdbc_password=$JDBC_PASSWORD", "-Djdbc_driver=$JDBC_DRIVER"]

CMD ["java", "-jar", "target/tracker.jar"]