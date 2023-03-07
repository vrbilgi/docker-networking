package main

import (
	"bufio"
	"fmt"
	"net"
	"os"
	"strings"
	"log"
)

func main() {

	logWriter, err := os.OpenFile("Client.log", os.O_RDWR | os.O_CREATE | os.O_APPEND, 0666)
	if err != nil {
    	log.Fatalf("error opening file: %v", err)
	}
	log.SetOutput(logWriter)
	defer logWriter.Close()

	arguments := os.Args
	if len(arguments) == 1 {
		fmt.Println("Please provide host:port.")
		log.Println("Please provide host:port")
		return
	}

	CONNECT := arguments[1]
	c, err := net.Dial("tcp", CONNECT)
	if err != nil {
		fmt.Println(err)
		return
	}

	fmt.Println("Client started...")
	log.Println("Client started...")

	for {
		reader := bufio.NewReader(os.Stdin)
		fmt.Print(">> ")
		log.Println(">> ")
		text, _ := reader.ReadString('\n')
		fmt.Fprintf(c, text+"\n")
		log.Println(c, text+"\n")

		message, _ := bufio.NewReader(c).ReadString('\n')
		fmt.Print("->: " + message)
		log.Println("->: " + message)
		if strings.TrimSpace(string(text)) == "STOP" {
			fmt.Println("TCP client exiting...")
			log.Println("TCP client exiting...")
			return
		}
	}
}
