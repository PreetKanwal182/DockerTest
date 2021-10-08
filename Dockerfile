FROM ubuntu:latest
 

RUN apt-get update 
RUN apt-get -qq -y install curl
# RUN apt update -y
RUN apt-get -qq -y install sudo
RUN apt-get install -y gnupg


# RUN curl -o /etc/yum.repos.d/mssql-server.repo https://packages.microsoft.com/config/rhel/7/mssql-server-2017.repo
# RUN curl -o /etc/yum/repos.d/mssql-server.repo https://packages.microsoft.com/config/rhel/7/mssql-server-2017.repo
# RUN yum install -y mssql-server
# RUN apt-get install -y mssql-server

# RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
# RUN add-apt-repository “$(wget -qO- https://packages.microsoft.com/config/ubuntu/16.04/mssql-server-preview.list)"
# RUN apt-get update
# RUN apt-get install -y mssql-server
# RUN /opt/mssql/bin/mssql-conf setup

RUN curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
RUN curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list | sudo tee /etc/apt/sources.list.d/msprod.list
RUN sudo apt-get update 
RUN sudo apt-get install mssql-tools
 
# ENV PATH=${PATH}:/opt/mssql/bin
# RUN mkdir -p /var/opt/mssql/data
# RUN chmod -R g=u /var/opt/mssql /etc/passwd
 
EXPOSE 1433
 
CMD sqlservr
