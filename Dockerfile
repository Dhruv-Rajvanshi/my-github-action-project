FROM openjdk:8-jre-alpine
WORKDIR /usr/app

RUN chmod +x gradlew
RUN ./gradlew build

COPY ./build/libs/my-app-1.0-SNAPSHOT.jar /usr/app/

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "my-app-1.0-SNAPSHOT.jar"]
