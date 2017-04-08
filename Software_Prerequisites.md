# Install Docker & Docker-Compose

I installed Docker and Docker-Compose for Ubuntu from the Docker [Installation Manual](https://store.docker.com/editions/community/docker-ce-server-ubuntu?tab=description)

You can change to `root` and not use `sudo` before the statements if you like.

```
sudo su
```

### Docker CE

I followed the standard instructions from Docker. The commands are given below. Note, that these are likely to change over time as new versions are released.

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
### Docker-Compose

After I installed Docker CE and made sure the engine was running I installed [Docker-Compose](https://docs.docker.com/compose/install/), alternately [Github/docker/compose](https://github.com/docker/compose/releases)

```
curl -L https://github.com/docker/compose/releases/download/1.12.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
```

### Installing Docker command-line completion

Instructions for [Command-line Completion](https://docs.docker.com/compose/completion/) for `bash`

```
curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose
```

### Running Docker without `sudo`

```
sudo gpasswd -a ${USER} docker
sudo service docker restart
```
You may need to change to `root` and back to `${USER}` before settings take effect.

