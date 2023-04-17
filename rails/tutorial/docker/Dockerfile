FROM ruby:3-alpine
RUN apk --update add bash git ruby-bundler
RUN echo "gem: --no-document" > ~/.gemrc
RUN addgroup -g 1000 rails && adduser -u 1000 rails -G rails -D
