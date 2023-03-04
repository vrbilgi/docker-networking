# case 1: 
# server is deployed in container and client is running from outside 

FROM golang:1.19-alpine
WORKDIR /app
COPY server.go ./.
# required for golang
COPY go.mod ./.  
# go build command
RUN go build -o ./server
# exe name and argmunent
CMD ["./server", "8090"]

# server 
# to build docker image
# docker build -t server-demo .
# to run the command
# case4server 

# client
# go build client.go

# ./client 0.0.0.0:8090

# to check the docker image is not running or not
# docker ps
# to get into the docker image
# docker exec -it 6dc6e63f94c2 sh  



