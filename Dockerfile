FROM registry.fedoraproject.org/f31/ruby
WORKDIR /app
ENV date="2021/04/19"
RUN microdnf update -y\
&& microdnf install -y ruby ruby-devel wget g++ make\
&& gem install -r mediawiki_api\
&& wget https://pagure.io/i18n/raw/main/f/meeting/create-meeting-boilerplate.rb\
&& microdnf clean all\
&& chmod +x create-meeting-boilerplate.rb
ENTRYPOINT /app/create-meeting-boilerplate.rb $date
