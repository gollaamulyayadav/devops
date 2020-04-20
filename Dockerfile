
FROM java:8  
COPY sample.java /var/www/java  
COPY target/grants.war /var/www/java
RUN javac sample.java  


