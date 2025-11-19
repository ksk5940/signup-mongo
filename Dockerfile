# Use Tomcat 9 with JDK 17 (Corretto, Amazon Linux 2)
FROM tomcat:9.0.111-jdk17-corretto-al2

# Remove default apps for smaller image
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your built WAR to ROOT.war for serving at "/"
COPY Signup-Login.war /usr/local/tomcat/webapps/ROOT.war

# Optional: Improve startup speed for some JVMs
ENV CATALINA_OPTS="$CATALINA_OPTS -Djava.security.egd=file:/dev/./urandom"
