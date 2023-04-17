FROM ruby:3-alpine
RUN apk --update add bash gcc git libc-dev libgcc make ruby-bundler ruby-dev sqlite sqlite-dev
RUN echo "gem: --no-document" > ~/.gemrc
RUN addgroup -g 1000 rails && adduser -u 1000 rails -G rails -D
