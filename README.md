## Socks Server 5 in Docker
[![build status badge](https://travis-ci.org/youmingdot/docker-socks-server-5.svg)](https://travis-ci.org/youmingdot/docker-socks-server-5)

#### Supported tags and respective `Dockerfile` links

+ 3.8.9, 3.8, latest [(3.8/Dockerfile)](https://github.com/youmingdot/docker-socks-server-5/blob/master/3.8/Dockerfile)

#### Author
+ You Ming (youming@funcuter.org)

#### Usage

###### Run a Socks Server 5 instance
```
$ docker run -d --name socks-server -p 1080:1080 youmingdot/socks-server-5:latest
```
The port of socks server is `1080`.
The default authorization whose name is `demo` and password is `1234`.

###### Set authorization
You can use `SS_USER` to set the name of authorization. 
You can use `SS_PASS` to set the pass of authorization. 
```
$ docker run -d --name socks-server -p 1080:1080 -e SS_USER=user -e SS_PASS=pass youmingdot/socks-server-5:latest
```

#### Apologize for my poor English
If there's some grammar or word errors, please point out.
如果发现有语法或者用词错误，敬请指出。
