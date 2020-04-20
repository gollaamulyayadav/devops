
FROM java:8  
COPY sample.java /usr/local/java  
COPY target/grants.war /usr/local/java
RUN javac sample.java  


