# We just want ubuntu with our apt packages already included
FROM ubuntu:23.04
RUN apt-get -y update
RUN apt-get -y install software-properties-common sudo git bc gpg gpg-agent bison build-essential ccache cpio fakeroot flex git kmod libelf-dev libncurses5-dev libssl-dev lz4 qtbase5-dev rsync schedtool wget zstd tar reprepro dpkg-sig devscripts dh-make rpm2cpio -y
# Install Pika Apt Sources
RUN wget https://ppa.pika-os.com/dists/lunar/pika-sources.deb
RUN DEBIAN_FRONTEND=noninteractive apt-get install ./pika-sources.deb --yes --option Acquire::Retries=5 --option Acquire::http::Timeout=100 --option Dpkg::Options::="--force-confnew"
RUN rm -rf ./pika-sources.deb
RUN DEBIAN_FRONTEND=noninteractive apt-get -y update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y upgrade --allow-downgrades
RUN ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata
