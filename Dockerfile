FROM --platform=linux/amd64 ubuntu:latest
ARG _ARM_ARCH="arm-unknown-linux-gnu"
ARG _ANACONDA_SHELL="Anaconda3-2022.10-Linux-aarch64.sh"

USER root

# ツール インスコ
RUN apt-get update && apt-get install -y wget sudo vim curl gawk make gcc git bzip2

# Anaconda 最新バージョンだとこける。なぜ？
# RUN wget https://repo.continuum.io/archive/Anaconda3-2022.10-Linux-aarch64.sh && \
#     sh Anaconda3-2022.10-Linux-aarch64.sh -b

RUN wget https://repo.continuum.io/archive/Anaconda3-2019.03-Linux-x86_64.sh && \
    sh Anaconda3-2019.03-Linux-x86_64.sh -b  && \
    rm -f Anaconda3-2019.03-Linux-x86_64.sh && \
    curl -sL https://deb.nodesource.com/setup_16.x | bash -  && \
    apt-get install -y nodejs

# 環境変数
ENV PATH $PATH:/root/anaconda3/bin

# Python インスコ
# RUN apt install -y python3.11 && apt install -y python3-pip

# TA-Lib ビルド via Apple M1, M2
RUN wget --quiet http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz -O ta-lib-0.4.0-src.tar.gz && \
    tar xvf ta-lib-0.4.0-src.tar.gz && \
    cd ta-lib/ && \
    ./configure --prefix=/usr && \
    make && make install && \
    cd .. && \
    pip install TA-Lib && \
    rm -R ta-lib ta-lib-0.4.0-src.tar.gz

RUN mkdir /pythonProjects
WORKDIR /pythonProjects

CMD ["jupyter-lab", "--ip=0.0.0.0","--port=8888" ,"--no-browser", "--allow-root", "--LabApp.token=''"]











