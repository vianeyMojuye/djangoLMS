# pull the official base image
FROM python:3.8.10
FROM ubuntu

#maintainer
MAINTAINER Menlah toto@toto.com

#install git
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive  apt-get install -y git

# set work directory
WORKDIR /usr/src/app

#free-up the work directory
RUN rm -rf /usr/src/app/*

#get project from git and store it into the work directory
RUN git clone https://github.com/diranetafen/static-website-example.git /usr/src/app/

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies
RUN pip install --upgrade pip 
COPY ./requirements.txt /usr/src/app
RUN pip install -r requirements.txt

# copy project
#COPY . /usr/src/app

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]




