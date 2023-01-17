FROM library/ubuntu:18.04
RUN apt-get update
RUN apt install -y wget build-essential libsm6 libglib2.0-0 libatlas-base-dev ffmpeg libblas-dev liblapack-dev libopenblas-dev gfortran python3.8-dev python3-pip vim git \
    && python3.8 -m pip install poetry==1.3.2

WORKDIR /app
COPY . /app/video_background_estimation/
