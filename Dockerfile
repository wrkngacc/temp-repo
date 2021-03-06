FROM maven:3.6.0-jdk-11-slim AS build
WORKDIR /app
COPY . /app
RUN  mvn --batch-mode clean package -DskipTests=true

FROM adoptopenjdk/openjdk11:alpine-jre
WORKDIR /opt/book-library
COPY --from=build app/back-dockerized/target/back-dockerized-0.0.1.jar /opt/book-library
#COPY /back-dockerized/target/back-dockerized-0.0.1-SNAPSHOT.jar /opt/book-library

ENV PROFILES_OPTION=""
ENV PORT 5000
EXPOSE $PORT

CMD [ "sh", "-c", "java -jar -Dserver.port=${PORT} $PROFILES_OPTION back-dockerized-0.0.1.jar" ]

# docker build . -t book-library-backend --rm (rm does not work)
# docker run --rm -it --name bl-back -p 9091:5000 -p 7073:7072 -p 8083:8082 -e PROFILES_OPTION=-Dspring-boot.run.profiles=production book-library-backend:latest

# one command line
# docker build . --rm -t book-library-backend && docker run --rm -it --name library -p 8091:5000 -p 7073:7072 -p 8083:8082 -e PROFILES_OPTION=-Dspring-boot.run.profiles=production book-library-backend
