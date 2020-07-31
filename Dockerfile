FROM adoptopenjdk/openjdk11:alpine-jre
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring
ARG JAR_FILE=build/libs/*.jar
COPY ${JAR_FILE} app.jar
COPY scripts/unfoldjson.sh unfold.sh
COPY scripts/docker-entrypoint.sh /usr/local/bin/
USER root
RUN chmod 777 unfold.sh
RUN chmod 777 /usr/local/bin/docker-entrypoint.sh
RUN ln -s /usr/local/bin/docker-entrypoint.sh /
RUN apk add --no-cache bash
RUN apk add --no-cache jq
USER spring:spring
ENTRYPOINT ["/bin/bash", "/usr/local/bin/docker-entrypoint.sh"]
