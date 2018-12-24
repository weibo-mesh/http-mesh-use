package main

import (
	"net/http"
	"net/http/httputil"
	"net/url"
)

const DEFAULT_BACKEND_URL = "http://python:8000"

func main() {
	// start server
	http.HandleFunc("/", func(res http.ResponseWriter, req *http.Request) {

		url, _ := url.Parse(DEFAULT_BACKEND_URL)

		// create the reverse proxy
		proxy := httputil.NewSingleHostReverseProxy(url)

		// Update the headers to allow for SSL redirection
		req.URL.Host = url.Host
		req.URL.Scheme = url.Scheme
		req.Header.Set("X-Forwarded-Host", req.Header.Get("Host"))
		req.Host = url.Host

		// Note that ServeHttp is non blocking and uses a go routine under the hood
		proxy.ServeHTTP(res, req)
	})
	if err := http.ListenAndServe(":8080", nil); err != nil {
		panic(err)
	}
}
