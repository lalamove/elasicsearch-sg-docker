FROM blacktop/elasticsearch:6.1.2
ENV OPENSSL_JAR "netty-tcnative-openssl-1.0.2l-static-2.0.5.Final-alpine-linux-x86_64.jar"

RUN elasticsearch-plugin install "com.floragunn:search-guard-6:6.1.2-20.1"
RUN elasticsearch-plugin install https://distfiles.compuscene.net/elasticsearch/elasticsearch-prometheus-exporter-6.1.2.0.zip
RUN apk add --no-cache -t .build-deps wget ca-certificates openssl \
  && wget -O /usr/share/elasticsearch/plugins/search-guard-6/$OPENSSL_JAR https://bintray.com/floragunncom/netty-tcnative/download_file?file_path=$OPENSSL_JAR \
  && apk del --no-cache --purge .build-deps
