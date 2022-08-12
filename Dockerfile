#
# Build stage
#
FROM ttbb/compile:jdk11-git-mvn AS build
COPY . /opt/sh/compile
WORKDIR /opt/sh/compile
RUN mvn -B clean package

FROM ttbb/flink:nake

COPY --from=build /opt/sh/compile/flink-mate/target/flink-mate-0.0.1.jar /opt/sh/flink/mate/flink-mate.jar

COPY docker-build /opt/sh/flink/mate

WORKDIR /opt/sh/flink

CMD ["/usr/bin/dumb-init", "bash", "-vx","/opt/sh/flink/mate/scripts/start.sh"]
