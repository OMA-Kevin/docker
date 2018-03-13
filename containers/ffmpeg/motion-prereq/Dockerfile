# Dockerfile for ffmpeg with pretty much support for everything as per:
# https://trac.ffmpeg.org/wiki/CompilationGuide/Centos
# includes codecs with weird licensing like MP3 and AAC.
#

FROM ffmpeg
MAINTAINER Ross Timson <ross@rosstimson.com>



RUN dnf -y --best --allowerasing install v4l-utils python-devel gcc curl python-pycurl python-tornado python-pillow python-backports-ssl_match_hostname python2-certifi git autoconf automake libjpeg-turbo libjpeg-turbo-devel make redhat-rpm-config which libwebp-devel ffmpeg-libs ffmpeg-devel ffmpeg-compat

#RUN cd /tmp && git clone https://github.com/Mr-Dave/motion.git motion-mrdave && cd /tmp/motion-mrdave  &&  autoreconf -fiv 
#RUN cd /tmp/motion-mrdave && ./configure --prefix=/usr --without-pgsql --without-sdl --without-sqlite3 --without-mysql 
#RUN cd /tmp/motion-mrdave && make
#RUN cd /tmp/motion-mrdave && make install  && cp motion /bin/motion   && rm -rf /tmp/motion-mrdave
#
#RUN cd /tmp && \
#    git clone https://github.com/ccrisan/motioneye.git && \
#    cd /tmp/motioneye && \
#    python setup.py install && \
#    mkdir -p /etc/motioneye /usr/share/motioneye/extra && \
#    cp /tmp/motioneye/extra/motioneye.conf.sample /usr/share/motioneye/extra/motioneye.conf.sample && \
#    rm -rf /tmp/motioneye
#
#VOLUME /etc/motioneye
#VOLUME /var/run/motion
#VOLUME /var/lib/motion
#
#CMD mkdir -p /var/lib/motioneye && test -e /etc/motioneye/motioneye.conf || \
#cp /usr/share/motioneye/extra/motioneye.conf.sample /etc/motioneye/motioneye.conf ; \
#/bin/meyectl startserver -c /etc/motioneye/motioneye.conf
#EXPOSE 8765


