FROM centos:7

# Install nginx
RUN yum update -y && \
  yum install -y epel-release && \
  yum install -y nginx && \
  yum clean all

# Copy our configuration files
COPY ./etc/nginx /etc/nginx/

VOLUME ["/var/cache/nginx", "/var/log/nginx"]

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
