package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello, World!  + version 2")
	})

	http.ListenAndServe("0.0.0.0:8080", nil)
}
