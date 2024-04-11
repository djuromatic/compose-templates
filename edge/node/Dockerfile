FROM golang:1.18

# Update and install dependencies

RUN apt-get -y update && apt-get -y install jq
 
# Build and install Edge

WORKDIR /app

RUN git clone -b 0.6.6 https://github.com/Route3/polygon-edge.git

WORKDIR /app/polygon-edge

RUN go build -o polygon-edge main.go

RUN cp /app/polygon-edge/polygon-edge /usr/bin/polygon-edge

RUN rm -rf /app/polygon-edge

WORKDIR /app
