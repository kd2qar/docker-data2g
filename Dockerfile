FROM debian:trixie-slim

#ADD https://github.com/arodland/Data2G.git#v0.5.3 /data2g
ADD data2g-0.5.3-linux-aarch64.tar.gz .

WORKDIR /data2g

COPY dot.bashrc /root/.bashrc
COPY  --chmod=0755 alsa_setup /root/bin/alsa_setup

RUN DEBIAN_FRONTEND="noninteractive" apt-get update && apt-get install -y libglib2.0-0 libasound2 libpulse0 libhamlib4 libdbus-1-3  libbrotli1 && \
	rm -rf /var/lib/apt/lists/*   && \
	rm -rf /var/cache/apt/archives/*

RUN /root/bin/alsa_setup

#COPY deps ./deps

#ENTRYPOINT  [ "/bin/bash" ]
# ./data2g web --web-port 8041 --web-listen 0.0.0.0
ENTRYPOINT ["/data2g/data2g","web","--web-port","8041","--web-listen","0.0.0.0"]
