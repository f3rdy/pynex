# pynex

A Sonatype Nexus REST proxy application written in python using flask. Currently under development.

# Build & Deploy

Ships as a docker image. It is based on alpine summing up to some 70 Mbytes image size. Currently no volume support.  

## Build

```
docker build -t pynex .
```

## Run

```
docker run -d -p 5000:5000 --name pynex pynex
```

