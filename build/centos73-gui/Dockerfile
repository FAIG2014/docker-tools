FROM centos:7.3.1611


MAINTAINER francis gagnaire 
USER root

RUN     yum clean all && yum update -y && yum clean all

RUN yum groups mark convert "Development Tools" && yum -y groupinstall 'Development Tools' && yum groups mark convert "Server with GUI" && yum -y groupinstall 'Server with GUI' 


CMD /bin/bash

