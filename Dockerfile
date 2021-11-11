FROM ruby:3-alpine
WORKDIR /app
ENV date="2021/04/19"
RUN apk add --no-cache ruby ruby-dev wget g++ make imagemagick-dev\
&& gem install -r mediawiki_api ruby-bugzilla xmlrpc rexml json\
&& wget https://pagure.io/i18n/raw/main/f/meeting/create-meeting-boilerplate.rb\
&& chmod +x create-meeting-boilerplate.rb
ENTRYPOINT /app/create-meeting-boilerplate.rb $date