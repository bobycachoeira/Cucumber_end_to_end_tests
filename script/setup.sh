docker stop container-ruby | true
docker rm -f container-ruby
docker build -t cucumber/cucumber .