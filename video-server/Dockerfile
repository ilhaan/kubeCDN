FROM tiangolo/nginx-rtmp

COPY nginx.conf /etc/nginx/nginx.conf

ADD https://github.com/mediaelement/mediaelement-files/raw/master/big_buck_bunny.mp4 /var/video.mp4
RUN chmod 644 /var/video.mp4
