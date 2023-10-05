#!/bin/bash

function server() {
  while true; do
    read method path version

    if [[ $method = "GET" ]]; then
      if [[ $path = "/tiger.html" ]]; then
        echo -e "HTTP/1.1 200 OK\n"
        cat ./www/tiger.html
      elif [[ $path = "/leopard.html" ]]; then
        echo -e "HTTP/1.1 200 OK\n"
        cat ./www/leopard.html
      elif [[ $path = "/lion.html" ]]; then
        echo -e "HTTP/1.1 200 OK\n"
        cat ./www/lion.html
      else
        echo -e "HTTP/1.1 404 Not Found\n"
        echo "Page not found"
      fi
    else
      echo -e "HTTP/1.1 400 Bad Request\n"
      echo "Bad Request"
    fi
  done
}

coproc SERVER_PROCESS { server; }
nc -lv 2345 <&${SERVER_PROCESS[0]} >&${SERVER_PROCESS[1]}
