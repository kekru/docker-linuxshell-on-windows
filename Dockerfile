FROM ubuntu

WORKDIR /data
RUN apt-get update && apt-get install -y \
    iputils-ping \
    dnsutils \
    tree \
    wget \
    curl \
    jq \
    nano
