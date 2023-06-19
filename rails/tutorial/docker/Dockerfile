FROM ruby:3-alpine

RUN apk --update add bash git build-base sqlite sqlite-dev \
                 imagemagick tzdata && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    echo "Asia/Tokyo" > /etc/timezone
RUN mkdir -p /workspace/container-home && addgroup -g 1000 rails && \
    adduser -u 1000 --home /workspace/container-home rails -G rails -D
