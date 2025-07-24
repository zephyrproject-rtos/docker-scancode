FROM python:3.12-slim

ENV SCANCODE_RELEASE=32.4.1

RUN apt-get update && apt-get install --no-install-recommends -y \
    build-essential \
    git \
    wget \
    curl \
    unzip \
    bzip2 \
    xz-utils \
    zlib1g \
    libxml2-dev \
    libxslt1-dev \
    libpopt0 \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /opt/scancode-toolkit && \
    wget -qO- "https://github.com/nexB/scancode-toolkit/archive/refs/tags/v${SCANCODE_RELEASE}.tar.gz" | \
    tar xz --strip-components=1 -C /opt/scancode-toolkit

WORKDIR /opt/scancode-toolkit

RUN ./scancode --help

ENV PATH="/opt/scancode-toolkit:$PATH"

RUN pip3 install pyyaml --no-cache-dir
