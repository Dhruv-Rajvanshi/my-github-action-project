FROM openjdk:8-jre-alpine
WORKDIR /usr/app


COPY ./build/libs/my-app-1.0-SNAPSHOT.jar /usr/app/
RUN chmod +x gradlew
RUN ./gradlew build
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "my-app-1.0-SNAPSHOT.jar"]
