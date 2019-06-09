FROM debian:stretch

WORKDIR /app
RUN apt-get -y update && apt-get install -y \
  sudo \
  git \
  wget \
  bzip2 \
  build-essential \
  bison \
  flex \
  gettext \
  texinfo \
  cpio \
  python \
  unzip \
  locales

RUN locale-gen en_US.UTF8 && locale-gen –no-purge –lang en_US.UTF8

RUN git clone https://github.com/negan07/ancistrus.git .
RUN ./scripts/hostprepare.sh

# Include any sources already downloaded
ADD *.tgz .

CMD make
