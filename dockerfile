FROM alpine:latest as builder

# Install necessary packages
RUN apk add --no-cache openjdk8 curl tar && \
    curl -O https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.89/bin/apache-tomcat-9.0.89.tar.gz && \
    mkdir -p /usr/local/tomcat && \
    tar -xzf apache-tomcat-9.0.89.tar.gz -C /usr/local/tomcat --strip-components=1 && \
    rm apache-tomcat-9.0.89.tar.gz && \
    rm -rf /usr/local/tomcat/webapps/examples \
           /usr/local/tomcat/webapps/docs \
           /usr/local/tomcat/webapps/manager \
           /usr/local/tomcat/webapps/host-manager && \
    chmod +x /usr/local/tomcat/bin/*.sh

# Copy necessary files
COPY redis-tomcat/lib/* /usr/local/tomcat/lib/
COPY redis-tomcat/conf/* /usr/local/tomcat/conf/
COPY mysql-connector-j-8.4.0.jar /usr/local/tomcat/lib/
COPY event.jsp /usr/local/tomcat/webapps/ROOT/
COPY index.jsp /usr/local/tomcat/webapps/ROOT/
COPY products1.jpg /usr/local/tomcat/webapps/ROOT/
COPY products2.jpg /usr/local/tomcat/webapps/ROOT/
COPY image.jpg /usr/local/tomcat/webapps/ROOT/
COPY redis-data-cache.properties /usr/local/tomcat/conf/
COPY jedis-3.7.1.jar /usr/local/tomcat/lib/
# Final stage
FROM alpine:latest

# Install necessary packages
RUN apk add --no-cache openjdk8-jre-base && \
    rm -rf /var/cache/apk/*

# Environment variables
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $JAVA_HOME/bin:$CATALINA_HOME/bin:$PATH

# Copy Tomcat from the builder stage
COPY --from=builder /usr/local/tomcat /usr/local/tomcat

# Expose the Tomcat port
EXPOSE 8080

# Command to run Tomcat
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]

