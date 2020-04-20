
FROM java:8  
COPY sample.java /usr/local
COPY target/grants.war /usr/local
RUN javac sample.java
CMD ["java","hello"]


