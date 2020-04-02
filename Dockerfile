#FROM ruby:2.5
FROM nbulai/ruby-chromedriver


MAINTAINER Robson Cachoeira <robson.cachoeira@db1.com.br>

ENV app_path /opt/jenkins/
WORKDIR ${app_path}

COPY Gemfile* ${app_path}

RUN bundle install


COPY . ${app_path}


#ENTRYPOINT ["bundle", "exec", "cucumber -p remote -p all  --format json -o /opt/jenkins/reports/cucumber.json"]
ENTRYPOINT ["sh", "./script/docker_exec.sh"]