# webdav
Docker image webdav with persistent volume & htpasswd

1. Create directory
mkdir -p /docker/data

2. Grant access docker user to the folder
chown -R docker:docker /docker  

3. Generate username/password
htpasswd -c /docker/.htpasswd _username_

4. Run the docker images
docker run -d -p 8880:80 -v /docker/data/:/webdav/input/ -v /docker/.htpasswd:/webdav/htpasswd:ro  --name webdav invaleed/webdav:latest

5. Access to ---> http://server:8880
