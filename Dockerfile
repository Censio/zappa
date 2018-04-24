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
    pip install --extra-index-url https://pypi.fury.io/JD5z7Rr3ZbuS4EXbPoRf/censio/ bottle==0.12.7 blist==1.3.6 cassandra-driver==3.6.0 requests==2.4.3 uwsgi==2.0.8 futures==2.2.0 censio-datamodel==0.1.235 webtest==2.0.18 censio-zuul==0.1.24 PyJWT==0.4.3 enum34==1.0.4 sqlalchemy==0.9.8 mock==1.0.1 pandas==0.16.2 psycopg2==2.5.4 scipy==0.16.0 numpy==1.9.2 msgpack-python==0.4.2 censio-flipper==0.1.10 webargs==1.6.0 bcrypt==1.1.0 true-event-messaging==0.1.59 trumonitor boto3==1.4.4 PyYAML==3.12 python-json-logger==0.1.7 jsonschema && \
    deactivate

CMD ["tail", "-f", "/dev/null"]

#pip install -I pip==7.1.2 && pip install --upgrade setuptools && pip install zappa && pip install Cython numpy==1.9.2 pandas==0.16.2 pytest && pip install .