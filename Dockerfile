FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    vim \
    locales \
    build-essential

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Insert additional things to download for container


# Keep the container running indefinitely
CMD ["tail", "-f", "/dev/null"]
