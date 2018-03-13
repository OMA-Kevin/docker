# Dockerfile for ffmpeg with pretty much support for everything as per:
# https://trac.ffmpeg.org/wiki/CompilationGuide/Centos
# includes codecs with weird licensing like MP3 and AAC.
#

FROM fedora
MAINTAINER Ross Timson <ross@rosstimson.com>

RUN dnf -y install --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

RUN dnf -y --best --allowerasing install v4l-utils python-devel gcc curl python-pycurl python-tornado python-pillow python-backports-ssl_match_hostname python2-certifi git autoconf automake libjpeg-turbo libjpeg-turbo-devel make redhat-rpm-config which libwebp-devel ffmpeg-libs ffmpeg-devel ffmpeg-compat autoconf automake cmake freetype-devel gcc gcc-c++ git libtool make mercurial nasm pkgconfig zlib-devel

# Yasm
RUN cd /usr/local/src \
    && git clone --depth 1 git://github.com/yasm/yasm.git \
    && cd yasm \
    && autoreconf -fiv \
    && ./configure --prefix="/usr/local" \
    && make \
    && make install

# libx264
RUN cd /usr/local/src \
    && git clone --depth 1 git://git.videolan.org/x264 \
    && cd x264 \
    && ./configure --prefix="/usr/local" --enable-static \
    && make \
    && make install

# libx265
RUN cd /usr/local/src \
    && hg clone https://bitbucket.org/multicoreware/x265 \
    && cd /usr/local/src/x265/build/linux \
    && cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="/usr/local" -DENABLE_SHARED:bool=off ../../source \
    && make \
    && make install

# libfdk_aac
RUN cd /usr/local/src \
    && git clone --depth 1 git://git.code.sf.net/p/opencore-amr/fdk-aac \
    && cd fdk-aac \
    && autoreconf -fiv \
    && ./configure --prefix="/usr/local" --disable-shared \
    && make \
    && make install

# libmp3lame
RUN cd /usr/local/src \
    && curl -L -O http://downloads.sourceforge.net/project/lame/lame/3.99/lame-3.99.5.tar.gz \
    && tar xzvf lame-3.99.5.tar.gz \
    && cd lame-3.99.5 \
    && ./configure --prefix="/usr/local" --disable-shared --enable-nasm \
    && make \
    && make install

# libopus
RUN cd /usr/local/src \
    && git clone https://git.xiph.org/opus.git \
    && cd opus \
    && autoreconf -fiv \
    && ./configure --prefix="/usr/local" --disable-shared \
    && make \
    && make install

# libogg
RUN cd /usr/local/src \
    && curl -O http://downloads.xiph.org/releases/ogg/libogg-1.3.2.tar.gz \
    && tar xzvf libogg-1.3.2.tar.gz \
    && cd libogg-1.3.2 \
    && ./configure --prefix="/usr/local" --disable-shared \
    && make \
    && make install

# libvorbis
RUN cd /usr/local/src \
    && curl -O http://downloads.xiph.org/releases/vorbis/libvorbis-1.3.5.tar.gz \
    && tar xzvf libvorbis-1.3.5.tar.gz \
    && cd libvorbis-1.3.5 \
    && ./configure --prefix="/usr/local" --disable-shared \
    # LDFLAGS="-L$HOME/ffmeg_build/lib" CPPFLAGS="-I$HOME/ffmpeg_build/include" ./configure --prefix="/usr/local" --with-ogg="$HOME/ffmpeg_build" --disable-shared \
    && make \
    && make install

# libvpx
RUN cd /usr/local/src \
    && git clone --depth 1 https://chromium.googlesource.com/webm/libvpx.git \
    && cd libvpx \
    && ./configure --prefix="/usr/local" --as=yasm --disable-examples \
    && make \
    && make install

