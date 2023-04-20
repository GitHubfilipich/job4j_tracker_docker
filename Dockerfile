FROM maven:3.6.3-openjdk-17

RUN mkdir job4j_tracker

WORKDIR job4j_tracker

COPY . .

RUN mvn install

RUN mvn -Pproduction liquibase:update

CMD ["java", "-jar", "target/tracker.jar"]