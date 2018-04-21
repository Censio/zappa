FROM lambci/lambda:build

MAINTAINER "Aviv Giladi" <aviv@cens.io>

COPY yum.conf /etc/yum.conf

RUN yum clean all && \
    yum -y install python27-devel python27-virtualenv vim gcc lapack-devel blas-devel atlas-devel geos geos-devel libyaml-devel libffi-devel freetype-devel zlib libpng-static libpng-devel && \
    pip install -I pip==7.1.2 && \
    pip install -U zappa

WORKDIR /var/task

RUN virtualenv /var/task/docker_env && \
    source /var/task/docker_env/bin/activate && \
    pip install -U pip && \
    deactivate

CMD ["tail", "-f", "/dev/null"]
