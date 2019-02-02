FROM python:3-alpine

WORKDIR /app

RUN apk add --no-cache curl
RUN curl -so envconsul.tgz https://releases.hashicorp.com/envconsul/0.7.3/envconsul_0.7.3_linux_amd64.tgz &&\
    tar -xvzf envconsul.tgz &&\
    mv envconsul /usr/local/bin/envconsul &&\
    chmod +x /usr/local/bin/envconsul

RUN pip install Flask

ADD hello.py .

CMD envconsul \
    -consul-addr "consul-server-bootstrap:8500" \
    -prefix hello-app \
    python hello.py
