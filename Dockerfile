FROM jenkins/jenkins:2.249.1-jdk11

RUN apt-get install -y wget

RUN wget --no-verbose -O /tmp/apache-maven-3.5.4-bin.tar.gz http://apache.cs.utah.edu/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.tar.gz

RUN tar xzf /tmp/apache-maven-3.5.4-bin.tar.gz -C /opt/

RUN ln -s /opt/apache-maven-3.5.4 /opt/maven

RUN ln -s /opt/maven/bin/mvn /usr/local/bin

RUN rm -f /tmp/apache-maven-3.5.4-bin.tar.gz

ENV MAVEN_HOME /opt/maven

RUN chown -R jenkins:jenkins /opt/maven

RUN apt-get clean

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

COPY seedJob.xml /usr/share/jenkins/ref/jobs/seed-job/config.xml

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false