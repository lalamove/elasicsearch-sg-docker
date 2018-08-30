FROM blacktop/elasticsearch:6.3.2
ENV OPENSSL_JAR "netty-tcnative-openssl-1.0.2o-static-2.0.8.Final-alpine-linux-x86_64.jar"

RUN elasticsearch-plugin install -b "com.floragunn:search-guard-6:6.3.2-23.0"
RUN elasticsearch-plugin install -b https://distfiles.compuscene.net/elasticsearch/elasticsearch-prometheus-exporter-6.3.2.0.zip
RUN apk add --no-cache -t .build-deps wget ca-certificates openssl \
  && wget -O /usr/share/elasticsearch/plugins/search-guard-6/$OPENSSL_JAR https://bintray.com/floragunncom/netty-tcnative/download_file?file_path=$OPENSSL_JAR \
  && apk del --no-cache --purge .build-deps
