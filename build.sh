#!/bin/bash
#"docker container stop polo-nginx-run -t 1"
#only use if we want to wait for it to shutdown using -t as seconds to wait
docker container rm -f polo-nginx-run
docker build -t polo-nginx . --no-cache
docker run --name polo-nginx-run -d -p 80:80 polo-nginx