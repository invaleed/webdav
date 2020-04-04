# webdav
Webdav docker image with persistent volume & htpasswd

## Usage

Create directory

```bash
mkdir -p /docker/data
```

Grant access docker user to the folder
```bash
chown -R docker:docker /docker  
```

Generate username/password
```bash
htpasswd -c /docker/.htpasswd _username_
```
Run the docker images

```bash
docker run -d -p 8880:80 \
-v /docker/data/:/webdav/input/ \
-v /docker/.htpasswd:/webdav/htpasswd:ro \
--name webdav \
invaleed/webdav:latest
```

Access Webdav
```bash
http://server:8880
```

Done

