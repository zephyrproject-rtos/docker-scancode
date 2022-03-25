FROM python:3.10

ENV SCANCODE_RELEASE=30.1.0

RUN apt-get update && apt-get install -y bzip2 xz-utils zlib1g libxml2-dev libxslt1-dev

ADD "https://github.com/nexB/scancode-toolkit/archive/refs/tags/v${SCANCODE_RELEASE}.tar.gz" .

RUN mkdir scancode-toolkit && tar xzvf v${SCANCODE_RELEASE}.tar.gz -C scancode-toolkit --strip-components=1

WORKDIR scancode-toolkit

RUN ./scancode --help

ENV PATH=$HOME/scancode-toolkit:$PATH

RUN pip3 install pyyaml
