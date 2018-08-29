FROM ubuntu:16.04
RUN mkdir -p /jenkins 
WORKDIR /jenkins
#python-software-properties

COPY apache-tomcat-8.5.33 /jenkins  && \ ls /jenkins

#COPY jenkins.war /jenkins/apache-tomcat-8.5.33/webapps/ && chmod +x *.sh /jenkins/apache-tomcat-8.5.33/bin/*.sh
COPY jenkins.war /jenkins/webapps/ && chmod +x *.sh /jenkins/bin/*.sh
#RUN ls /jenkins && ls  /jenkins/webapps/ && ls /jenkins/bin/

EXPOSE 8080

CMD ["/jenkins/bin/catalina.sh", "run"]
#ENTRYPOINT ["./bin/startup.sh", "run"]
#CMD ["sh" "/bin/startup.sh", "run"]
#CMD ["/jenkins/apache-tomcat-8.5.33/bin/catalina.sh", "run"]


#EXPOSE 8080


#ENTRYPOINT [ "/nodejs/bin/node", "server/server.js" ]



#sudo apt-get install python-pip