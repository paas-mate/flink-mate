#
# Build stage
#
FROM ttbb/compile:jdk11-git-mvn AS build
COPY . /opt/compile
WORKDIR /opt/compile
RUN mvn -B clean package

FROM ttbb/flink:nake

COPY --from=build /opt/compile/flink-mate/target/flink-mate-0.0.1.jar /opt/flink/mate/flink-mate.jar

COPY docker-build /opt/flink/mate

WORKDIR /opt/flink

CMD ["/usr/bin/dumb-init", "bash", "-vx","/opt/flink/mate/scripts/start.sh"]
