# Base off the kali rolling image
FROM kalilinux/kali-rolling

# Metadata
LABEL maintainer="jakob.pennington@gmail.com"

# Create a user
RUN useradd -ms /usr/bin/zsh hack

# Environment variables
ENV HOME /home/hack
ENV DEBIAN_FRONTEND=noninteractive

#Set up environment
WORKDIR /home/hack/workspace
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
    python3 \
    python3-pip \
    ssh \
    tmux \
    tzdata \
    vim \
    wget \
    zsh \
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
    libpcap-dev \
    python3 \
    xauth

# Install essential tools
RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
    amass \
    awscli \
    dirb \
    dirsearch \
    dnsrecon \
    eyewitness \
    ffuf \
    ftp \
    httprobe \
    hydra \
    masscan \
    massdns \
    nmap \
    payloadsallthethings \
    seclists \
    sqlmap \
    theharvester \
    whois \
    wpscan

# go
RUN cd /tmp \
    && wget https://go.dev/dl/go1.22.4.linux-amd64.tar.gz \
    && rm -rf /usr/local/go \
    && tar -C /usr/local -xzf go1.22.4.linux-amd64.tar.gz
ENV PATH=$PATH:/usr/local/go/bin

# Install Go tools
RUN go install github.com/spf13/cobra-cli@latest && \
    go install github.com/owasp-amass/amass/v4/...@master && \
    go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest && \
    go install github.com/projectdiscovery/httpx/cmd/httpx@latest && \
    go install github.com/OJ/gobuster/v3@latest && \
    go install github.com/hakluke/hakrawler@latest

# Configure python(s)
RUN python3 -m pip install --upgrade setuptools && python3 -m pip install --upgrade wheel

# Set up personal configuration
RUN cd ${HOME}/toolkit \
    && git clone https://github.com/JakobRPennington/config.git \
    && cd config \
    && chmod +x setup-linux.sh \
    && ./setup-linux.sh

# Run with ZSH
CMD ["/usr/bin/zsh","-l"]