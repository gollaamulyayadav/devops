
FROM java:8  
COPY sample.java 
COPY target/grants.war
RUN javac sample.java
CMD ["java","hello"]


