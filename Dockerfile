FROM alpine:3.5
RUN mkdir -p /var/lib/jenkins 

RUN apt-get update -y &&  apt-get install software-properties-common -y && \
  add-apt-repository ppa:webupd8team/java -y && \
  apt-get update && \
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  apt-get install -y oracle-java8-installer && \
  apt-get install -y oracle-java8-set-default && \
  javac -version && \
  wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add - && \
  deb https://pkg.jenkins.io/debian-stable binary/ && \
  apt-get update &&  apt-get install jenkins && /etc/init.d/jenkins status 

RUN   apt-get install -y apt-transport-https ca-certificates curl && \
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
	add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable" && \
   apt-get update -y && apt-get install -y docker-ce && \
   /etc/init.d/docker status && \
   chmod 777 /var/run/docker.sock && \
   #docker version && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer && \
  apt-get purge software-properties-common -y

EXPOSE 8080

CMD ["/etc/init.d/jenkins" "start"]

