## Test Java Docker image UseContainer option

```bash
./mvnw clean install -Dmaven.test.skip
docker build -t demo-test:0.1 .
docker run --rm --name demo -it --memory="512m" -e "JAVA_OPTIONS=-XX:+UseContainerSupport -XX:MaxRAMPercentage=80.0" demo-test:0.1
docker stats
```

## Docker Images tested

`docker run --rm --name demo -it --memory="512m" -e "JAVA_OPTIONS=-XX:+UseContainerSupport -XX:MaxRAMPercentage=80.0" demo-test:0.1`

_FROM adoptopenjdk/openjdk11:jre-11.0.11_9-ubuntu_
**Result**
```
DemoApplication - Initial Memory (xms) : 94 mb
DemoApplication - Max Memory (xmx) : 4752 mb
```

_FROM eclipse-temurin:11.0.18_10-jre-jammy_
**Result**
```
DemoApplication - Initial Memory (xms) : 8 mb
DemoApplication - Max Memory (xmx) : 396 mb
```
