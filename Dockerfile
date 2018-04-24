FROM lambci/lambda:build

MAINTAINER "Aviv Giladi" <aviv@cens.io>

COPY yum.conf /etc/yum.conf

RUN yum clean all && \
    yum -y install python27-devel python27-virtualenv python-devel vim gcc libev libev-devel lapack-devel blas-devel atlas-devel geos geos-devel libyaml-devel libffi-devel freetype-devel zlib libpng-static libpng-devel && \
    pip install -I pip==7.1.2 && \
    pip install -U zappa

WORKDIR /var/task

RUN virtualenv /var/venv && \
    source /var/venv/bin/activate && \
    pip install -U pip && \
    pip install --upgrade setuptools && \
    pip install Cython numpy==1.9.2 pandas==0.16.2 pytest && \
    deactivate

CMD ["tail", "-f", "/dev/null"]
