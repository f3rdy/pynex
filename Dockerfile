FROM gliderlabs/alpine:3.3

MAINTAINER Fred Thiele <ferdy_news@gmx.de>

# Taken from frovlad/alpine-python3
RUN apk add --no-cache python3 && \
    apk add --no-cache --virtual=build-dependencies wget ca-certificates && \
    wget "https://bootstrap.pypa.io/get-pip.py" -O /dev/stdout | python3 && \
    apk del build-dependencies

# environment
EXPOSE 5000
ENV WORKDIR "/myapp"

# alpine syntax for adduser slightly different from useradd
RUN adduser -D -s /bin/bash -h $WORKDIR pynex

USER pynex
ADD requirements.txt $WORKDIR
RUN pip3 install --user -r $WORKDIR/requirements.txt
ADD pynex $WORKDIR/pynex


# startup
WORKDIR $WORKDIR/pynex
CMD ["python3", "main.py"]
