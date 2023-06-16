ARG PYTHON_VERSION
FROM amazonlinux:2

RUN yum update -y && \
  yum groupinstall "Development Tools" -y && \
  yum erase openssl-devel -y && \
  yum install openssl11 openssl11-devel  libffi-devel bzip2-devel wget -y && \
  wget https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz && \
  tar -xf Python-$PYTHON_VERSION.tgz && \
  cd Python-$PYTHON_VERSION && \
  ./configure --enable-optimizations && \
  make && \
  make install

ENTRYPOINT ["/bin/bash"]