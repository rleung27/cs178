#!/bin/bash

# Once pom.xml, config.xml or other source files are updated, 
# this script will update the maven build files and
# redeploy the WAR file, so it will be accessible via
# http://192.168.56.1:8080/rleun-servlet-countthrees/count
dir="/usr/local/tomcat/webapps/rleun-servlet-countthrees/"
war_file="/usr/local/tomcat/webapps/rleun-servlet-countthrees.war"
dir_exists="no"

# remove the old, extracted rleun-servlet-countthrees.war contents
rm -f $war_file
rm -rf $dir

cd /home/rleung27/cs178/week5/rleun-servlet-countthrees/
mvn compile package # re-creates the war file

# copy the new war file into /usr/local/tomcat/webapps, so
# the contents can be automatically extracted into
# /usr/local/tomcat/webapps/rleun-servlet-countthrees
# can manually view the contents of the war file by typing
# jar -tf rleun-servlet-countthrees.war
chown rleung27:rleung27 /home/rleung27/cs178/week5/rleun-servlet-countthrees/target/rleun-servlet-countthrees.war
cp /home/rleung27/cs178/week5/rleun-servlet-countthrees/target/rleun-servlet-countthrees.war /usr/local/tomcat/webapps/
sleep 5
chown -R rleung27:rleung27 /usr/local/tomcat/webapps/rleun-servlet-countthrees/

# stop tomcat
catalina.sh stop

# start tomcat
catalina.sh start

echo "view servlet at http://192.168.56.1:8080/rleun-servlet-countthrees/count"

