#!/usr/bin/env bash 
docker build -t ilhaanvideo . && docker run -d -p 1935:1935 --name testilhaanvideo ilhaanvideo
