# Install Docker & Docker-Compose

I installed Docker and Docker-Compose for Ubuntu from the Docker [Installation Manual](https://store.docker.com/editions/community/docker-ce-server-ubuntu?tab=description)

You can change to `root` and not use `sudo` before the statements if you like.

```
sudo su
```

Then I followed the standard instructions from Docker:

```
sudo apt-get -y install \
  apt-transport-https \
  ca-certificates \
  curl
```

```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

```
sudo add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable"
```

```
sudo apt-get update
```

```
sudo apt-get -y install docker-ce
```

Next, I installed [Docker-Compose](https://docs.docker.com/compose/install/), alternately [Github/docker/compose](https://github.com/docker/compose/releases)

```
curl -L https://github.com/docker/compose/releases/download/1.12.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
```

Installing Docker [command-line completion](https://docs.docker.com/compose/completion/) for `bash`

```
curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose
```

