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



RUN apt-get install -y \
    git \
    fish


RUN mkdir --parents /download/docker-client \ 
 && curl https://get.docker.com/builds/Linux/i386/docker-latest.tgz | tar xvz --directory /download/docker-client

RUN mv /download/docker-client/docker/docker /usr/local/bin/docker \
 && chmod +x /usr/local/bin/docker

RUN curl -L https://github.com/docker/compose/releases/download/1.11.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose \
 && chmod +x /usr/local/bin/docker-compose

RUN mkdir --parents ~/.config/fish/completions \
 && mv /download/docker-client/docker/completion/fish/docker.fish ~/.config/fish/completions


ENV gitemail="kevin@whiledo.de" \
    gitname="Kevin Krummenauer"

RUN git config --global user.email "$gitemail" \
 && git config --global user.name "$gitname"


CMD fish
