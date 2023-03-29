#FROM adoptopenjdk/openjdk11:jre-11.0.11_9-ubuntu
FROM eclipse-temurin:11.0.18_10-jre-jammy
#FROM adoptopenjdk:11-jre-hotspot-focal
#RUN apt update && apt upgrade -y
WORKDIR /deployments
COPY target/demo-*-SNAPSHOT.jar demo.jar
RUN addgroup appuser && adduser --disabled-password appuser --ingroup appuser
USER appuser
CMD java $JAVA_OPTIONS -jar demo.jar