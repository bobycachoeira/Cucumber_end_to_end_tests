
docker run -v "$(pwd):/opt/jenkins" -P -e TAG=$TAG --name container-ruby cucumber/cucumber
docker stop container-ruby | true
docker rm -f container-ruby
docker rmi -f cucumber/cucumber