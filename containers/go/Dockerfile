#
# fedora-golang
#
FROM fedora:22
ENV GO_VERSION 1.5.1
# Install dependencies (such as Mercurial which is required for log4go)
RUN dnf -y install hg tar gzip; dnf clean all

# Update distribution
RUN dnf -y update; dnf clean all

# Install Go
RUN dnf -y groupinstall "Development Tools"; yum clean all
#RUN mkdir /goroot
#RUN mkdir /gopath
#RUN curl -o /tmp/go.tar.gz https://storage.googleapis.com/golang/go1.5.1.linux-amd64.tar.gz 
#RUN tar -xzf -C "/goroot" /tmp/go.tar.gz 
#RUN rm /tmp/go.tar.gz


RUN curl -sSL https://golang.org/dl/go$GO_VERSION.linux-amd64.tar.gz | tar -v -C /usr/local -xz


## Install dependencies (such as Mercurial which is required for log4go)
#RUN dnf -y install hg; dnf clean all

# Setup environment
ENV GOROOT /goroot
ENV GOPATH /gopath
ENV PATH $PATH:$GOROOT/bin:$GOPATH/bin

# Add build and run scripts
ADD go-build /bin/go-build
ADD go-run /bin/go-run

# Setup simple hello world app
ADD hello.go /src/hello.go
RUN mkdir -p /gopath/src; rm -rf /gopath/src/app/; ln -s /src /gopath/src/app
#RUN /bin/go-build

# ONBUILD ADD . /gopath/src/app/
# ONBUILD RUN /bin/go-build

EXPOSE 8080
CMD ["/bin/go-run"]
#ENTRYPOINT ["/bin/go-run"]
