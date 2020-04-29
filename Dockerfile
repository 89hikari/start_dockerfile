FROM ruby:2.7.1-buster

RUN mkdir -p /opt/app
RUN mkdir -p /opt/dependencies
ADD Gemfile Gemfile.lock /opt/dependencies/
RUN bundle install --gemfile=/opt/dependencies/Gemfile --retry=3 --jobs=4
ADD . /opt/app/

ENTRYPOINT ["ruby", "/opt/app/app.rb"]

EXPOSE 4567 
