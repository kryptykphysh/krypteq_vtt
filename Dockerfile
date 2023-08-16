ARG CONTAINER_GID=1000 \
    CONTAINER_UID=1000 \
    CONTAINER_USER=rails \
    IMAGEMAGICK_VERSION=7.1.0-5 \
    RUBY_VERSION=3.2.2

FROM ruby:${RUBY_VERSION}-slim
ARG CONTAINER_GID \
    CONTAINER_UID \
    CONTAINER_USER \
    IMAGEMAGICK_VERSION

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get -y install \
      build-essential \
      ffmpeg \
      libpq-dev \
      libvips \
      mupdf \
      mupdf-tools \
      poppler-utils \
      postgresql-client \
      postgresql-contrib \
      wget && \
    rm -rf /var/lib/apt/lists/*

RUN wget -qO /tmp/im.tar.xz https://imagemagick.org/archive/releases/ImageMagick-$IMAGEMAGICK_VERSION.tar.xz && \
    wget -qO /tmp/im.sig https://imagemagick.org/archive/releases/ImageMagick-$IMAGEMAGICK_VERSION.tar.xz.asc &&\
    gpg --batch --keyserver keyserver.ubuntu.com --recv 89AB63D48277377A && \
    gpg --batch --verify /tmp/im.sig /tmp/im.tar.xz && \
    tar xJf /tmp/im.tar.xz -C /tmp && \
    cd /tmp/ImageMagick-$IMAGEMAGICK_VERSION && \
    ./configure --with-rsvg && \
    make -j 9 && make install && \
    ldconfig /usr/local/lib && \
    rm -rf /tmp/* && \
    addgroup --gid $CONTAINER_GID $CONTAINER_USER && \
    adduser --shell "/bin/bash" --uid $CONTAINER_UID --gid $CONTAINER_GID $CONTAINER_USER

WORKDIR /app

COPY --chown=$CONTAINER_USER:$CONTAINER_USER . /app

RUN bundle install && \
    chown -R $CONTAINER_USER:$CONTAINER_USER /tmp /usr/local/bundle

USER $CONTAINER_USER
SHELL ["/bin/bash", "-l", "-c"]
