FROM openjdk:8-jre-alpine
WORKDIR /usr/app


COPY ./build/libs/my-app-1.0-SNAPSHOT.jar /usr/app/

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "my-app-1.0-SNAPSHOT.jar"]
