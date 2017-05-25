MAINTAINER shipsun/centos6.8 <543999860@qq.com>
LABEL name="ELK" \
    vendor="shipSun" \
    build-date="2017-05-19"
yum -y install wget
ADD jdk-8u131-linux-x64.tar.gz /home/
RUN cd /home && tar zxvf jdk-8u131-linux-x64.tar.gz && mv jdk1.8.0_131 /usr/local && rm -rf jdk-8u131-linux-x64.tar.gz
RUN cd ~ && echo "export JAVA_HOME=/usr/local/jdk1.8.0_131" >> .bashrc && echo "export JRE_HOME=${JAVA_HOME}/jre" >> .bashrc && echo "export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib" >> .bashrc && echo "export PATH=${JAVA_HOME}/bin:$PATH" >> .bashrc && source ~/.bashrc
RUN cd /home && wget https://artifacts.elastic.co/downloads/logstash/logstash-5.4.0.tar.gz
RUN cd /home && tar zxvf logstash-5.4.0.tar.gz && cd logstash-5.4.0
RUN cd /home && wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.4.0.tar.gz
RUN cd /home && tar zxvf elasticsearch-5.4.0.tar.gz && cd elasticsearch-5.4.0

RUN cd /home && wget https://artifacts.elastic.co/downloads/kibana/kibana-5.4.0-linux-x86_64.tar.gz
