FROM ubuntu:18.04

RUN apt-get update -y
RUN apt-get install postgresql-client -y
RUN apt-get install python3-pip -y
RUN pip3 install awscli

ADD backup.sh /backup.sh

CMD ["sh", "/backup.sh"]
