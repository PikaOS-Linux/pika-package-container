# We just want ubuntu with our apt packages already included
FROM ubuntu:23.04
RUN apt-get -y update
RUN apt-get -y install software-properties-common sudo git bc gpg gpg-agent bison build-essential ccache cpio fakeroot flex git kmod libelf-dev libncurses5-dev libssl-dev lz4 qtbase5-dev rsync schedtool wget zstd tar reprepro dpkg-sig devscripts -y
RUN DEBIAN_FRONTEND=noninteractive wget -q -O - https://ppa.pika-os.com/key.gpg | sudo apt-key add -
RUN DEBIAN_FRONTEND=noninteractive add-apt-repository https://ppa.pika-os.com
RUN DEBIAN_FRONTEND=noninteractive add-apt-repository ppa:pikaos/pika
RUN DEBIAN_FRONTEND=noninteractive add-apt-repository ppa:kubuntu-ppa/backports
RUN DEBIAN_FRONTEND=noninteractive apt-get -y update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y upgrade --allow-downgrades
RUN ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata
