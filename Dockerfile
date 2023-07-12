FROM python:3.8

ENV PYTHONUNBUFFERED 1 

RUN mkdir /vms

WORKDIR /vms

#COPY . /vms/

RUN apt-get update && apt-get -y install gcc

RUN pip install python-magic

RUN pip install pillow

RUN pip install boto

RUN pip install -r requirements.txt

COPY . /vms/

EXPOSE 80