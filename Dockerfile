FROM codejuggle/base:latest

RUN apt-get -y install ant git openjdk-6-jdk

ENV JAVA_HOME /usr/lib/jvm/java-6-openjdk-amd64

WORKDIR /data

RUN wget -O idea.tar.gz http://download.jetbrains.com/idea/ideaIC-13.1.4b.tar.gz
RUN tar xzf idea.tar.gz && rm -f idea.tar.gz
RUN ln -s `echo idea*` idea

RUN git clone --depth=1 --branch master https://github.com/go-lang-plugin-org/go-lang-idea-plugin.git
RUN cd go-lang-idea-plugin && sed -i 's,${user.home}/Tools/idea-.*",/data/idea/",g' build-package.xml
RUN cd go-lang-idea-plugin && ant -f build-package.xml
RUN mkdir /target || true
RUN cp /data/go-lang-idea-plugin/dist/ro.redeul.google.go.jar /target

RUN rm -rf /etc/service/cron /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/sbin/my_init"]
