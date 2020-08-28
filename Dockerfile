FROM python:3.6-slim-stretch

RUN apt-get -y update
RUN apt-get install -y --fix-missing \
    build-essential \
    cmake \
    gfortran \
    git \
    wget \
    curl \
    graphicsmagick \
    libgraphicsmagick1-dev \
    libatlas-base-dev \
    libavcodec-dev \
    libavformat-dev \
    libgtk2.0-dev \
    libjpeg-dev \
    liblapack-dev \
    libswscale-dev \
    pkg-config \
    python3-dev \
    python3-numpy \
    software-properties-common \
    zip \
    && apt-get clean && rm -rf /tmp/* /var/tmp/*


LABEL maintainer="bilalyar26@gmail.com"
LABEL roll_no="PIAIC78340"
ENV CREATEDBY="M. BILAL NAEEM"
COPY . /app
WORKDIR /app
RUN  pip3 install -r requirements.txt 
# also provided host=0.0.0.0 in app.run as a parameter in app.py
EXPOSE 2020
CMD gunicorn app:app --reload