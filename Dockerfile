FROM ubuntu

ENV gitemail="kevin@whiledo.de" \
    gitname="Kevin Krummenauer"

WORKDIR /data
RUN apt-get update && apt-get install -y \
    iputils-ping \
    dnsutils \
    tree \
    wget \
    curl \
    jq \
    nano \
	vim \
    git \
    fish

RUN mkdir --parents /ressources/docker-client \ 
 && curl https://get.docker.com/builds/Linux/i386/docker-latest.tgz | tar xvz --directory /ressources/docker-client \
 && mv /ressources/docker-client/docker/docker /usr/local/bin/docker \
 && chmod +x /usr/local/bin/docker \

 && curl -L https://github.com/docker/compose/releases/download/1.11.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose \
 && chmod +x /usr/local/bin/docker-compose \

 && mkdir --parents ~/.config/fish/completions \
 && mv /ressources/docker-client/docker/completion/fish/docker.fish ~/.config/fish/completions


RUN chmod +x /ressources/entrypoint.sh

ENTRYPOINT /ressources/entrypoint.sh
CMD fish
