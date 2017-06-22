#包下载地址 http://pan.baidu.com/s/1qYmDUxQ
MAINTAINER shipsun/centos6.8 <543999860@qq.com>
LABEL name="ELK" \
    vendor="shipSun" \
    build-date="2017-05-19"
yum -y install wget

COPY jdk-8u131-linux-x64.tar.gz /home/
COPY logstash-5.4.0.tar.gz /home/
COPY elasticsearch-5.4.0.tar.gz /home/
COPY kibana-5.4.0-linux-x86_64.tar.gz /home/

RUN cd /home && tar zxvf jdk-8u131-linux-x64.tar.gz && mv jdk1.8.0_131 /usr/local && rm -rf jdk-8u131-linux-x64.tar.gz
RUN cd ~ && echo "export JAVA_HOME=/usr/local/jdk1.8.0_131" >> .bashrc && echo "export JRE_HOME=${JAVA_HOME}/jre" >> .bashrc && echo "export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib" >> .bashrc && echo "export PATH=${JAVA_HOME}/bin:$PATH" >> .bashrc && source ~/.bashrc
RUN cd /home && tar zxvf logstash-5.4.0.tar.gz && mv logstash-5.4.0 /usr/local && rm -rf logstash-5.4.0.tar.gz
RUN cd /home && tar zxvf elasticsearch-5.4.0.tar.gz && mv elasticsearch-5.4.0 /usr/local && rm -rf elasticsearch-5.4.0.tar.gz
RUN cd /home && tar zxvf kibana-5.4.0-linux-x86_64.tar.gz && mv kibana-5.4.0-linux-x86_64 /usr/local && rm -rf kibana-5.4.0-linux-x86_64.tar.gz
