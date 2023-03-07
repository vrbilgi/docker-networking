# case 2: 
# client is deployed in container and server is running from outside 

FROM golang:1.19-alpine
WORKDIR /app
COPY client.go server.go ./.
# required for golang
COPY go.mod ./.  
# go build command
RUN go build client.go 
RUN go build server.go
# exe name and argmunent
#CMD ["./client", "0.0.0.0:8090"]
CMD ["./server", "8090"]

# server 
# to build docker image
# docker build -t server-demo .
# to run the command
# docker run -p 8080:8090 server-demo 

# client
# go build client.go

# ./client 0.0.0.0:8090

# to check the docker image is not running or not
# docker ps
# to get into the docker image
# docker exec -it 6dc6e63f94c2 sh  



