FROM ttbb/flink:nake-1-12-7

COPY docker-build /opt/flink/mate

WORKDIR /opt/flink

CMD ["/usr/bin/dumb-init", "bash", "-vx","/opt/flink/mate/scripts/start.sh"]
