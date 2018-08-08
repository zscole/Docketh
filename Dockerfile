#base image is go-lang on alpine
FROM golang:1.10-alpine as builder
#executes command on top of current image as new layer
#commits results 
RUN apk update
RUN apk add --no-cache make gcc musl-dev linux-headers
RUN apk add --no-cache git mercurial
ADD . /go-ethereum 
RUN cd . /go-etherum
RUN git clone https://github.com/ethereum/go-ethereum && make geth

#copies from source to dest path in images file system

#changes to geth directory and then compiles geth
#RUN cd /go-ethereum && make geth
#multi stage build
#base image is alpine
#FROM alpine:latest
#no cache allows users to install packages with an index 
#that is updated and used on-the-fly and not cached locally
#ca certificate adds self signed ca root certification 
#RUN apk add --no-cache ca-certificates
#COPY --from=builder /go-ethereum/build/bin/geth /usr/local/bin/
#EXPOSE 8545 8546 30303 30303/udp
#ENTRYPOINT ["geth"]