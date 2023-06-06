#!/bin/bash

# Start Gitea
docker compose -f /vagrant/setup/docker-compose.yml up -d

# Wait until ready
while true; do 
  echo 'Trying to connect to http://192.168.111.202:3000 ...'; 
  if [ $(curl -s -o /dev/null -w "%{http_code}" http://192.168.111.202:3000) == "200" ]; then 
    echo '... connected.'; 
    break; 
  else 
    echo '... no success. Sleep for 5s and retry.'; 
    sleep 5; 
  fi 
done

# Add user
docker container exec -u 1000 gitea gitea admin user create --username alex --password password1 --email alex@do1.exam

# Clone the project
git clone https://github.com/AlexMitev91/Dokcer-Compose-Gitea.git /tmp/project

# Modify the repository
cd /tmp/project && git add . && git commit -m "Initial Commit"

# Add it to Gitea (but as public repository)
cd /tmp/project && git push -o repo.private=false http://alex:password1@192.168.111.202:3000/alex/project