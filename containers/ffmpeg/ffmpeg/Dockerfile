# Dockerfile for ffmpeg with pretty much support for everything as per:
# https://trac.ffmpeg.org/wiki/CompilationGuide/Centos
# includes codecs with weird licensing like MP3 and AAC.
#

FROM codec

# ffmpeg
#
# TODO:  Work out why freetype support isn't working in order to use:  --enable-libfreetype
RUN cd /usr/local/src \
    && git clone --depth 1 git://source.ffmpeg.org/ffmpeg \
    && cd ffmpeg \
    && PKG_CONFIG_PATH="/usr/local/lib/pkgconfig" ./configure --prefix="/usr/local" --extra-cflags="-I/usr/local/include" --extra-ldflags="-L/usr/local/lib" --pkg-config-flags="--static" --enable-gpl --enable-nonfree --enable-libfdk-aac --enable-libmp3lame --enable-libopus --enable-libvorbis --enable-libvpx --enable-libx264 --enable-libx265 \
    && make \
    && make install


RUN rm -rf /usr/local/src/* \
    && dnf clean all \
    && dnf erase -y autoconf automake cmake freetype-devel gcc gcc-c++ git libtool make mercurial nasm pkgconfig zlib-devel

