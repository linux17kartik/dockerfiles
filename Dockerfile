##THIS IS WORKING COPY FOR JENKINGS TEST PEOJECT AND BUILD #18
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


#RUN chmod +x *.sh /jenkins/bin/*.sh
RUN cd /jenkins/bin/ &&  chmod +x *.sh && cd ../../
#RUN ls /jenkins && ls  /jenkins/webapps/ && ls /jenkins/bin/

#EXPOSE 8080

#CMD ["/jenkins/bin/catalina.sh", "run"]
#ENTRYPOINT ["./bin/startup.sh", "run"]
#CMD ["sh" "/bin/startup.sh", "run"]
#CMD ["/jenkins/apache-tomcat-8.5.33/bin/catalina.sh", "run"]


#EXPOSE 8080


#ENTRYPOINT [ "/nodejs/bin/node", "server/server.js" ]


###########################################################################
#sudo apt-get install python-pip

#JENKINS CONFIGURATION FOR THE DOCKER BUILD
#ls

#cat Dockerfile

#wget http://mirrors.wuchna.com/apachemirror/tomcat/tomcat-8/v8.5.33/bin/apache-tomcat-8.5.33.zip

#unzip apache-tomcat-8.5.33.zip

#ls apache-tomcat-8.5.33

#wget https://updates.jenkins-ci.org/download/war/2.140/jenkins.war

#ls

#cd tomcat

#docker build -t linux17kartik/jenkins:v28.08.0 .
#docker build -t itsolvs/jenkins:v2 .

#docker images

#docker login --username=username --password=password

#docker login --username=linux17kartik --password=g1234567

#docker images

#docker push itsolvs/jenkins:v2

#docker push linux17kartik/jenkins:v28.08.0

#docker rmi itsolvs/jenkins:v1
