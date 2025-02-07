# First stage: Build the application
FROM openjdk:8-jdk-alpine AS build

WORKDIR /usr/app

COPY . .

RUN chmod +x gradlew
RUN ./gradlew build

# Second stage: Create a smaller runtime image
FROM openjdk:8-jre-alpine

WORKDIR /usr/app

# Copy only the built JAR from the first stage
COPY --from=build /usr/app/build/libs/my-app-1.0-SNAPSHOT.jar /usr/app/

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "my-app-1.0-SNAPSHOT.jar"]
