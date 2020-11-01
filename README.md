# Radicale (Dockerized)

This is a small set of configuration files that make it easier to run
[Radicale][0] in a Docker container.

Radicale is a lovely CalDAV and CardDAV server written in Python. I decided to
try building the infrastructure required to run it in a Docker container, just
for fun and as an exercise in containerization.

You probably shouldn't rely on this for anything important. There are several
`radicale` Docker images available on [Docker Hub][1] that you should consider
using instead.

[0]: https://github.com/Kozea/Radicale
[1]: https://hub.docker.com/search?q=radicale&type=image

## Installation and Usage

First, install [Docker][2] and configure it for your system.

Then, clone this repository and run the following command to build the
`radicale` Docker image.

```
docker build -t radicale ./radicale-dockerized/
```

Create a username and password by running:

```
htpasswd -c ./radicale-dockerized/users [username]
```

You can read more about this step in the [Radicale documentation][3].

Now, run the image:

```
docker run -p 5232:5232 -v radicale-storage:/home/radicale/storage -d radicale
```

You should now be able to access Radicale at http://localhost:5232. All stored
data lives in the `radicale-storage` Docker volume, which you can find by
running `docker inspect radicale-storage`.

[2]: https://docs.docker.com/get-docker/
[3]: https://radicale.org/3.0.html#tutorials/basic-configuration/authentication
