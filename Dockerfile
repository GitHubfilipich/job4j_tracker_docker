FROM maven:3.6.3-openjdk-17

RUN mkdir job4j_tracker

WORKDIR job4j_tracker

COPY . .

#RUN mvn package -Dmaven.test.skip=true

ARG JDBC_URL
ARG JDBC_USERNAME
ARG JDBC_PASSWORD
ARG JDBC_DRIVER

RUN ["mvn", "liquibase:update", "-Pdocker", "-DJDBC_URL=$JDBC_URL",
"-DJDBC_USERNAME=$JDBC_USERNAME", "-DJDBC_PASSWORD=$JDBC_PASSWORD",
"-DJDBC_DRIVER=$JDBC_DRIVER"]

#CMD ["java", "-jar", "target/tracker.jar"]