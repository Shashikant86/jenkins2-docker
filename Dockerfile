FROM jenkinsci/jenkins:2.0-beta-1
MAINTAINER shashikant.jagtap@aol.co.uk
# Prep Jenkins Directorieos

USER root
RUN mkdir /var/log/jenkins
RUN mkdir /var/cache/jenkins
RUN chown -R jenkins:jenkins /var/log/jenkins
RUN chown -R jenkins:jenkins /var/cache/jenkins
USER jenkins

# Set Defaults
ENV JAVA_OPTS="-Xmx8192m"

