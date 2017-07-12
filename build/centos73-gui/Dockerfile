FROM centos:7.3.1611


MAINTAINER francis gagnaire 
USER root

RUN    yum clean all \
    && yum update -y \
    && yum clean all \
    && yum groups mark convert "Development Tools" \
    && yum -y groupinstall 'Development Tools' \
    && yum groups mark convert "Server with GUI" \
    && yum -y groupinstall 'Server with GUI' \
    && yum clean all



CMD /bin/bash

