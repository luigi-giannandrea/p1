FROM jenkins/jenkins
USER root
RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive \
    apt-get install --no-install-recommends --assume-yes \
      docker.io sudo
RUN gpasswd -a jenkins docker
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
RUN service docker start
USER jenkins

