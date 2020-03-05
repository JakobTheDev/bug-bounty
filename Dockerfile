# Base off the lastest ubuntu image
FROM ubuntu:18.04

# Metadata
LABEL maintainer="jakob.pennington@gmail.com"

# Environment variables
ENV HOME /root
ENV DEBIAN_FRONTEND=noninteractive

#Set up environment
WORKDIR /root
RUN mkdir ${HOME}/toolkit && \
    mkdir ${HOME}/wordlists && \
    mkdir ${HOME}/workspace

# Install base packages
# This list should be stable to optimise docker builds
RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
    apt-utils \
    build-essential \
    curl \
    dnsutils \
    gcc \
    git \
    iputils-ping \
    locales \
    make \
    nano \
    net-tools \
    perl \
    python \
    python-pip \
    python3 \
    python3-pip \
    tzdata \
    vim \
    wget \
    && rm -rf /var/lib/apt/lists/*

# The important part (fonts)
RUN locale-gen "en_US.UTF-8" \
    && LC_ALL=en_US.UTF-8 \
    && LANG=en_US.UTF-8 \
    && cd ${HOME}/toolkit \
    && git clone https://github.com/powerline/fonts.git --depth=1 \
    && sh fonts/install.sh \
    && rm -rf fonts

# Install dependencies
RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
    python3.7

# Install essential tools
RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
    awscli \
    dirb \
    dnsrecon \
    hydra \
    nikto \
    nmap \
    sqlmap \
    whois

# configure python(s)
RUN python -m pip install --upgrade setuptools && python3 -m pip install --upgrade setuptools && python3.7 -m pip install --upgrade setuptools

# go
RUN cd /opt && \
    wget https://dl.google.com/go/go1.13.3.linux-amd64.tar.gz && \
    tar -xvf go1.13.3.linux-amd64.tar.gz && \
    rm -rf /opt/go1.13.3.linux-amd64.tar.gz && \
    mv go /usr/local
ENV GOROOT /usr/local/go
ENV GOPATH /root/go
ENV PATH ${GOPATH}/bin:${GOROOT}/bin:${PATH}

# gobuster
RUN cd ${HOME}/toolkit && \
    git clone https://github.com/OJ/gobuster.git && \
    cd gobuster && \
    go get && go install

# seclists
RUN cd ${HOME}/wordlists && \
    git clone --depth 1 https://github.com/danielmiessler/SecLists.git

# theharvester
RUN cd ${HOME}/toolkit && \
    git clone https://github.com/AlexisAhmed/theHarvester.git && \
    cd theHarvester && \
    python3.7 -m pip install -r requirements.txt && \
    chmod +x theHarvester.py && \
    ln -sf ${HOME}/toolkit/theHarvester/theHarvester.py /usr/local/bin/theharvester

# Set up personal configuration
RUN cd ${HOME}/toolkit && \
    git clone https://github.com/JakobRPennington/config.git && \
    cd config && \
    chmod +x setup-linux.sh && \
    ./setup-linux.sh

# Run with ZSH
CMD ["/usr/bin/zsh","-l"]
