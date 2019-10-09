FROM        alpine:3.10.2
RUN         mkdir /scripts \
            && echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
            && echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
            && apk update \
            && apk add curl
COPY        entrypoint.sh /scripts/entrypoint.sh
RUN         chmod +x /scripts/entrypoint.sh \
            && wget https://releases.hashicorp.com/packer/1.4.4/packer_1.4.4_linux_amd64.zip
RUN         unzip packer_1.4.4_linux_amd64.zip \
            && mv packer /usr/local/bin/ \
            && rm packer_1.4.4_linux_amd64.zip
VOLUME      [ "/data" ]
VOLUME      [ "/secrets" ]
VOLUME      [ "/ssh" ]
ENV         build=19.10.5
ENTRYPOINT  [ "/scripts/entrypoint.sh" ]
WORKDIR     /data
LABEL       maintainer="David Sanders" \
            org="DGSD Consulting, Inc." \
            packer_version="1.4.4" \
            build="19.10.5"
