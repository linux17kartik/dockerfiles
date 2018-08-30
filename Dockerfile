##THIS IS WORKING COPY FOR JENKINGS TEST PEOJECT AND BUILD #18
#FROM ubuntu:16.04
FROM alpine:3.5
RUN mkdir -p /var/lib/jenkins 
WORKDIR /var/lib/jenkins
#python-software-properties
RUN apt-get update -y &&  apt-get install software-properties-common -y && \
  add-apt-repository ppa:webupd8team/java -y && \
  apt-get update && \
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  apt-get install -y oracle-java8-installer && \
  apt-get install -y oracle-java8-set-default
 # java -version

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

RUN /etc/init.d/docker start && chmod 777 /var/run/docker.sock

COPY apache-tomcat-8.5.33 /var/lib/jenkins  

RUN ls /var/lib/jenkins

COPY jenkins.war /var/lib/jenkins/webapps/


RUN cd /var/lib/jenkins/bin/ &&  chmod +x *.sh && cd

EXPOSE 8080

#CMD ["/etc/init.d/docker", "start"]

CMD ["/jenkins/bin/catalina.sh", "run"]
