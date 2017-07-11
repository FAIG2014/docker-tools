FROM centos:7.3.1611


MAINTAINER francis gagnaire 
USER root

RUN     yum clean all && yum update -y && yum clean all

RUN yum groups mark convert "Development Tools" && yum -y groupinstall 'Development Tools' && yum groups mark convert "Server with GUI" && yum -y groupinstall 'Server with GUI' 




# needed for wireshark
RUN yum install -y autoconf automake libtool byacc flex qt-devel gtk3-devel libpcap-devel 

# be able to run wireshark within docker. (because of Qt)
ENV QT_GRAPHICSSYSTEM "native"

CMD /bin/bash

