FROM phusion/baseimage
MAINTAINER nozaki.dev



#インストール 
RUN apt-get update && apt-get -y upgrade \
    && apt-get -y install build-essential \
    && apt-get -y install libtool autotools-dev autoconf \
    && apt-get -y install libssl-dev \
    && apt-get -y install libboost-all-dev \
    && apt-get -y install git vim curl wget \
    && apt-get -y install python \
    && apt-get -y install language-pack-ja-base language-pack-ja ibus-mozc \
    && apt-get -y install man \
    && apt-get -y install manpages-ja \
    && apt-get -y install tzdata \
    && rm -rf /var/lib/apt/lists/*


#日本語環境設定
RUN update-locale LANG=ja_JP.UTF-8 LANGUAGE=ja_JP:ja
ENV LANG ja_JP.UTF-8
ENV LC_ALL ja_JP.UTF-8
ENV LC_CTYPE ja_JP.UTF-8

#タイムゾーン設定
ENV TZ Asia/Tokyo
RUN rm /etc/localtime
RUN ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

#その他設定

CMD ["/sbin/my_init"]

