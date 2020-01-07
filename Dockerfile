FROM python:2.7

ENV SCANCODE_RELEASE=3.1.1

RUN apt-get update && apt-get install bzip2 xz-utils zlib1g libxml2-dev libxslt1-dev

ADD "https://github.com/nexB/scancode-toolkit/releases/download/v${SCANCODE_RELEASE}/scancode-toolkit-${SCANCODE_RELEASE}.tar.bz2" .

RUN mkdir scancode-toolkit && tar xjvf scancode-toolkit-*.tar.bz2 -C scancode-toolkit --strip-components=1

WORKDIR scancode-toolkit

RUN ./scancode --help

ENV PATH=$HOME/scancode-toolkit:$PATH

RUN pip2 install pyyaml
