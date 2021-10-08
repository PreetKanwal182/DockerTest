FROM ubuntu:latest
 

RUN apt-get update 
RUN apt-get -qq -y install curl
# RUN apt update -y
#RUN apt-get -qq -y install yum


RUN curl -o /etc/apt/repos.d/mssql-server.repo https://packages.microsoft.com/config/rhel/7/mssql-server-2017.repo
RUN apt-get install -y mssql-server
 
ENV PATH=${PATH}:/opt/mssql/bin
 
RUN mkdir -p /var/opt/mssql/data
RUN chmod -R g=u /var/opt/mssql /etc/passwd
 
EXPOSE 1433
 
CMD sqlservr
