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

# Server 
# To build docker image
#   docker build -t server-demo -f case1.Dockerfile .
# To run the command
#   docker run --name server-demo-1 -p 8080:8090 -d server-demo 

# Client
#   go build client.go
#   ./client 0.0.0.0:8080

# To check the docker image is not running or not
#   docker ps -a
# To get into the docker image
#   docker exec -it server-demo-1 sh  



