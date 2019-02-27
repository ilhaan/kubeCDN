#!/usr/bin/env bash 
#
# Use this script to build and run the video-server docker 
# image locally from the Dockerfile in this directory 
#

docker build -t ilhaanvideo . && docker run -d -p 1935:1935 --name testilhaanvideo ilhaanvideo
