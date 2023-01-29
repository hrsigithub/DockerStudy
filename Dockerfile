FROM ubuntu
ARG _ARM_ARCH="arm-unknown-linux-gnu"
USER root

RUN apt-get update

# ツール インスコ
RUN apt-get install -y wget vim curl gawk make gcc git
RUN apt-get install bzip2

# Python インスコ
RUN apt install -y python3.11 && apt install -y python3-pip

RUN wget --quiet http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz -O ta-lib-0.4.0-src.tar.gz && \
    tar xvf ta-lib-0.4.0-src.tar.gz && \
    cd ta-lib/ && \
    ./configure --enable-utf8-only --with-charset=utf8 --build=${_ARM_ARCH} --host=${_ARM_ARCH} --target=${_ARM_ARCH} --prefix=/usr && \
    make && make install && \
    cd .. && \
    pip install TA-Lib && \
    rm -R ta-lib ta-lib-0.4.0-src.tar.gz











# docker builder prune
# docker build -t python-dev:1.0 .
# docker run --name python-dev -it -d python-dev:1.0
# docker exec -it  python-dev bash
