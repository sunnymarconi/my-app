FROM tomcat:9-jre8-alpine
LABEL AUTHOR="Sunny Sinha"
LABEL EMAIL="sinhasunny6@gmail.com"
COPY target/myweb*.war /usr/local/tomcat/webapps/myweb.war
