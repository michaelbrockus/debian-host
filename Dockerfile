#
# author: Michael Brockus.
# gmail: mailto:michaelbrockus@gmail.com
#
FROM debian:bullseye

ENV DEBIAN_FRONTEND noninteractive
ENV LANG 'C.UTF-8'
ENV CI 1

RUN apt-get update --fix-missing && apt-get upgrade -y \
    && apt-get -y install \
       apt-utils \
       python3 \
       python3-pip \
       python3-wheel \
       python3-setuptools \
       gcc-10 \
       g++-10 \
       gdc \
       rustc \
       default-jdk \
       default-jre \
       git \
       ccache \
       cppcheck \
       libssl-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 -q install --upgrade pip \
    && python3 -m pip -q install \
       meson==0.56.0 \
       pyinstaller==4.0 \
       scan-build==2.0.19 \
       ninja==1.10.0.post2 \
       cmake==3.18.2.post1 \
       PyQt5==5.15.1 \
       pytest==6.1.2 \
       pytest-mock==3.3.1 \
       pytest-xdist==2.1.0 \
       pytest-benchmark==3.2.3
