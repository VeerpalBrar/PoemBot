FROM ruby:2.5.8
RUN apt-get update && apt-get install -y build-essential
RUN apt-get install -y nodejs

ENV APP_HOME /myapp
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN bundle install

ADD . $APP_HOME

# Add a script to be executed every time the container starts.
RUN yarn
EXPOSE 3000

# Start the main process.

CMD ["rails", "server", "-b", "0.0.0.0"]
