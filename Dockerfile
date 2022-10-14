FROM centos:7
RUN yum update
RUN yum -y install httpd curl
RUN curl -L http://www.naver.com > /var/www/html/index.html
EXPOSE 80
CMD httpd -DFOREGROUND
