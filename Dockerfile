FROM ubuntu:16.04
RUN mkdir -p /jenkins 
WORKDIR /jenkins
#python-software-properties
RUN apt-get update -y &&  apt-get install software-properties-common -y && \
  add-apt-repository ppa:webupd8team/java -y && \
  apt-get update && \
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  apt-get install -y oracle-java8-installer && \
  apt-get install -y oracle-java8-set-default && \
  javac -version

RUN apt-get install -y apt-transport-https ca-certificates curl && \
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
	add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable" && \
   apt-get update -y && apt-get install -y docker-ce && \
   #docker version && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer && \
  apt-get purge software-properties-common -y


COPY apache-tomcat-8.5.33 /jenkins  

RUN ls /jenkins

#COPY jenkins.war /jenkins/apache-tomcat-8.5.33/webapps/ && chmod +x *.sh /jenkins/apache-tomcat-8.5.33/bin/*.sh
COPY jenkins.war /jenkins/webapps/ 
RUN chmod +x *.sh /jenkins/bin/*.sh
#RUN ls /jenkins && ls  /jenkins/webapps/ && ls /jenkins/bin/

EXPOSE 8080

CMD ["/jenkins/bin/catalina.sh", "run"]
#ENTRYPOINT ["./bin/startup.sh", "run"]
#CMD ["sh" "/bin/startup.sh", "run"]
#CMD ["/jenkins/apache-tomcat-8.5.33/bin/catalina.sh", "run"]


#EXPOSE 8080


#ENTRYPOINT [ "/nodejs/bin/node", "server/server.js" ]



#sudo apt-get install python-pip