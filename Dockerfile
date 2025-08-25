FROM jenkins/jenkins:jdk21

USER root


RUN apt-get update && \
    apt-get install -y \
    docker.io \
    curl \
    wget \
    vim \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


RUN groupadd -f docker && usermod -aG docker jenkins


RUN curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose


USER jenkins


RUN jenkins-plugin-cli --plugins \
    docker-workflow \
    pipeline-stage-view \
    git \
    workflow-aggregator \
    blueocean
