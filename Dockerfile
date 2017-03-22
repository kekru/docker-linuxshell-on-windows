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
    fish \
	bash-completion

RUN mkdir --parents /resources/docker-client \ 
 && curl https://get.docker.com/builds/Linux/i386/docker-latest.tgz | tar xvz --directory /resources/docker-client \
 && mv /resources/docker-client/docker/docker /usr/local/bin/docker \
 && chmod +x /usr/local/bin/docker \

 && curl -L https://github.com/docker/compose/releases/download/1.11.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose \
 && chmod +x /usr/local/bin/docker-compose \

 && mkdir --parents ~/.config/fish/completions \
 && mv /resources/docker-client/docker/completion/fish/docker.fish ~/.config/fish/completions \
 
 && mv /resources/docker-client/docker/completion/bash/docker /etc/bash_completion.d/docker

ADD resources/* /resources/
RUN chmod +x /resources/entrypoint.sh

ENTRYPOINT ["/resources/entrypoint.sh"]
CMD ["fish"]
