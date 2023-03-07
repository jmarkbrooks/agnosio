FROM ruby:latest

RUN mkdir -p /app
COPY . /app
COPY ./entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh
WORKDIR /app
RUN bundle install
#ENTRYPOINT ["/usr/bin/entrypoint.sh"]
EXPOSE 3000
CMD ["bundle","exec","rails","server","-b","0.0.0.0"]
