FROM codejuggle/base:latest

RUN apt-get update; apt-get -y upgrade
RUN apt-get -y install ant git openjdk-7-jdk

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

WORKDIR /data

RUN wget -O idea.tar.gz http://download.jetbrains.com/idea/ideaIC-14.0.2.tar.gz
RUN tar xzf idea.tar.gz && rm -f idea.tar.gz

ADD dockercachebuster.dat /tmp/cachebuster
RUN git clone --depth=1 --branch master https://github.com/go-lang-plugin-org/go-lang-idea-plugin.git
RUN ln -s ../`echo idea*` go-lang-idea-plugin/idea-IC
RUN cd go-lang-idea-plugin && ant -f build-package.xml

RUN rm -rf /etc/service/cron /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/sbin/my_init"]
