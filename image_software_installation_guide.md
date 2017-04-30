# Install Docker & Docker-Compose

I installed Docker and Docker-Compose for Ubuntu from the Docker [Installation Manual](https://store.docker.com/editions/community/docker-ce-server-ubuntu?tab=description)

You can change to `root` and not use `sudo` before the statements if you like.

```
$ sudo su
```

### Docker CE

I followed the standard instructions from Docker. The commands are given below. Note, that these are likely to change over time as new versions are released.

```
$ sudo apt-get -y install \
  apt-transport-https \
  ca-certificates \
  curl
```

```
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

```
$ sudo add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable"
```

```
$ sudo apt-get update
```

```
$ sudo apt-get -y install docker-ce
```
### Docker-Compose

After I installed Docker CE and made sure the engine was running I installed [Docker-Compose](https://docs.docker.com/compose/install/), alternately [Github/docker/compose](https://github.com/docker/compose/releases)

```
$ curl -L https://github.com/docker/compose/releases/download/1.12.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
$ chmod +x /usr/local/bin/docker-compose
```

### Installing Docker command-line completion

Instructions for [Command-line Completion](https://docs.docker.com/compose/completion/) for `bash`

```
$ curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose
```

### Running Docker without `sudo`

```
$ sudo gpasswd -a ${USER} docker
$ sudo service docker restart
```
You may need to change to `root` and back to `${USER}` before settings take effect.

# Setting up CyVerse Data Store and iRods iCommands 

[Instructions](https://pods.iplantcollaborative.org/wiki/display/DS/Setting+Up+iCommands)

```
$ iinit
```
You will be queried to set up your `irods_environment.json`

Enter the following:

|statement  |input  |  
|-----------|-------|
| DNS | *data.iplantcollaborative.org* |
|port number|*1247*|
|user name| *your user name*|
|zone|*iplant*|

Set up auto-complete for iCommands
[instructions](https://pods.iplantcollaborative.org/wiki/display/DS/Setting+Up+iCommands)

Download [i-commands-auto.bash](https://pods.iplantcollaborative.org/wiki/download/attachments/6720192/i-commands-auto.bash).
In your home directory, rename i-commands-auto.bash to .i-commands-auto.bash
In your .bashrc or .bash_profile, enter the following: 
source .i-commands-auto.bash

# Install R-base and RStudio

Set up [CRAN](https://cran.r-project.org/)

```
$ sudo sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list'
```

```
$ gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
```

```
$ gpg -a --export E084DAB9 | sudo apt-key add -
```

```
$ sudo apt-get update
```

### Install R

Version: Monday 2017-03-06, Another Canoe, R-3.3.3

```
$ sudo apt-get -y install r-base r-base-dev
```

### Install RStudio

Version:  1.0.136
Released:  2016-12-21

```
$ sudo apt-get install gdebi-core
$ wget https://download2.rstudio.org/rstudio-server-1.0.136-amd64.deb
$ sudo gdebi rstudio-server-1.0.136-amd64.deb

```
