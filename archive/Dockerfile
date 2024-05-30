# Base off the lastest ubuntu image
FROM ubuntu:18.04

# Metadata
LABEL maintainer="jakob.pennington@gmail.com"

# Environment variables
ENV HOME /root
ENV DEBIAN_FRONTEND=noninteractive

#Set up environment
WORKDIR /root/workspace
RUN mkdir ${HOME}/toolkit \
    && mkdir ${HOME}/wordlists

# Add a volume
VOLUME ["/root/workspace"]

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
    gnupg \
    iputils-ping \
    jq \
    locales \
    make \
    nano \
    net-tools \
    perl \
    python \
    python-pip \
    python3 \
    python3-pip \
    ssh \
    tmux \
    tzdata \
    vim \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Add Kali pagkages list
RUN sh -c "echo 'deb https://http.kali.org/kali kali-rolling main non-free contrib' > /etc/apt/sources.list.d/kali.list" \
    && wget 'https://archive.kali.org/archive-key.asc' \
    && apt-key add archive-key.asc

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
    libpcap-dev \
    python3.7 \
    xauth

# Install essential tools
RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
    amass \
    awscli \
    dirb \
    dnsrecon \
    ftp \
    hydra \
    masscan \
    nikto \
    nmap \
    sqlmap \
    theharvester \
    whois \
    wpscan

# go
RUN cd /opt \
    && wget https://dl.google.com/go/go1.13.3.linux-amd64.tar.gz \
    && tar -xvf go1.13.3.linux-amd64.tar.gz \
    && rm -rf /opt/go1.13.3.linux-amd64.tar.gz \
    && mv go /usr/local
ENV GOROOT /usr/local/go
ENV GOPATH /root/go
ENV PATH ${GOPATH}/bin:${GOROOT}/bin:${PATH}

# configure python(s)
RUN python -m pip install --upgrade setuptools && python3 -m pip install --upgrade setuptools && python3.7 -m pip install --upgrade setuptools && python3 -m pip install --upgrade wheel

# install pip modules
RUN python3 -m pip install \
    loguru \
    pandas \
    slack-webhook \
    xmltodict

# Install odbc driver and pyodbc
# From https://docs.microsoft.com/en-us/sql/connect/odbc/linux-mac/installing-the-microsoft-odbc-driver-for-sql-server?view=sql-server-ver15
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
    && curl https://packages.microsoft.com/config/debian/10/prod.list > /etc/apt/sources.list.d/mssql-release.list \
    && apt-get update -y \
    && ACCEPT_EULA=Y apt-get install -y --no-install-recommends msodbcsql17 unixodbc-dev python3-setuptools python3-dev \
    && python3 -m pip install pyodbc


# chaos client - projectdiscovery.io
RUN GO111MODULE=on go get -u github.com/projectdiscovery/chaos-client/cmd/chaos

# dirsearch
RUN cd ${HOME}/toolkit \
    && git clone https://github.com/maurosoria/dirsearch.git

# eyewitness
RUN cd ${HOME}/toolkit \
    && git clone https://github.com/FortyNorthSecurity/EyeWitness.git \
    && cd EyeWitness/Python/setup \
    && ./setup.sh

# fuff
RUN go get github.com/ffuf/ffuf

# gobuster
RUN cd ${HOME}/toolkit \
    && git clone https://github.com/OJ/gobuster.git \
    && cd gobuster \
    && go get && go install

# gron
RUN go get -u github.com/tomnomnom/gron

# hakrawler
RUN go get github.com/hakluke/hakrawler

# httprobe
RUN go get -u github.com/tomnomnom/httprobe

# masscan
RUN cd ${HOME}/toolkit \
    && git clone https://github.com/robertdavidgraham/masscan \
    && cd masscan \
    && make \
    && cp bin/masscan /usr/bin

# massdns
RUN cd ${HOME}/toolkit \
    && git clone https://github.com/blechschmidt/massdns \
    && cd massdns \
    && make \
    && cp bin/massdns /usr/bin

# payloadsallthethings
RUN cd ${HOME}/wordlists \
    && git clone --depth 1 https://github.com/swisskyrepo/PayloadsAllTheThings

# seclists
RUN cd ${HOME}/wordlists \
    && git clone --depth 1 https://github.com/danielmiessler/SecLists.git

# subfinder
RUN go get -v github.com/projectdiscovery/subfinder/cmd/subfinder

# Set up personal configuration
RUN cd ${HOME}/toolkit \
    && git clone https://github.com/JakobRPennington/config.git \
    && cd config \
    && chmod +x setup-linux.sh \
    && ./setup-linux.sh

# Run with ZSH
CMD ["/usr/bin/zsh","-l"]
