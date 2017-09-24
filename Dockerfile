# Dockerfile to build images that will run youtube-dl and do post-processing as
# described in uniquerockrz's and Jacob Tomlinson's answers at 
# https://askubuntu.com/questions/178481/how-to-download-an-mp3-track-from-a-youtube-video 
# and 
# http://rg3.github.io/youtube-dl/download.html

# Base docker image
FROM ubuntu:16.04
LABEL maintainer "Wayne Decatur *(fomightez on Github)*"

# Install Chromium
RUN apt-get update && apt-get install -y \
    python2.7-dev \
    python-numpy \
    python-matplotlib \
    python-pip \
    ffmpeg \
    wget \
    curl \
    unzip \
    nano \
    && rm -rf /var/lib/apt/lists/*  && \

    wget -O /opt/get-pip.py --no-check-certificate https://bootstrap.pypa.io/get-pip.py && \
    python /opt/get-pip.py && \
    rm -f /opt/get-pip.py 

RUN pip install --upgrade youtube_dl 

# Default command
WORKDIR /youtubedl
CMD ["bash"]
