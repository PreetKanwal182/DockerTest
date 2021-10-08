FROM ubuntu:latest
 

RUN apt-get update 
RUN apt-get -qq -y install curl
# RUN apt update -y
#RUN apt-get -qq -y install yum


# RUN curl -o /etc/yum.repos.d/mssql-server.repo https://packages.microsoft.com/config/rhel/7/mssql-server-2017.repo
# RUN curl -o /etc/yum/repos.d/mssql-server.repo https://packages.microsoft.com/config/rhel/7/mssql-server-2017.repo
# RUN yum install -y mssql-server
# RUN apt-get install -y mssql-server

RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
RUN add-apt-repository “$(wget -qO- https://packages.microsoft.com/config/ubuntu/16.04/mssql-server-preview.list)"
RUN apt-get update
RUN apt-get install -y mssql-server

RUN /opt/mssql/bin/mssql-conf setup
 
#ENV PATH=${PATH}:/opt/mssql/bin
#RUN mkdir -p /var/opt/mssql/data
#RUN chmod -R g=u /var/opt/mssql /etc/passwd
 
EXPOSE 1433
 
CMD sqlservr
