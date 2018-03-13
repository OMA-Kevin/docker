FROM centos:latest
MAINTAINER The CentOS Project <cloud-ops@centos.org>
RUN yum -y clean all;
RUN yum -y update; yum clean all
RUN yum -y install git gitweb httpd cgit java-1.7.0-openjdk-devel wget; yum clean all

