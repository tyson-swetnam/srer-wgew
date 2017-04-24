# Moving image files off Google.Drive to a Jetstream VM

The University of Arizona has an unlimited Google.drive storage service.

This works well for uploading sUAS imagery - both from the field and from PC

## Install Go language

Google.Drive uses the `go` language. In order to work with it you need to [install `go`](https://golang.org/doc/install) onto the VM.

```
$ wget https://storage.googleapis.com/golang/go1.8.1.linux-amd64.tar.gz
```

```
$ tar -C /usr/local -xzf go1.8.1.linux-amd64.tar.gz
```

In `/etc/profile` add: `export PATH=$PATH:/usr/local/go/bin`

In `~/.bashrc` add:  
```
export GOPATH=$HOME/go
export PATH=$GOPATH:$GOPATH/bin:$PATH
```
Follow the `go`instructions to [test the installation](https://golang.org/doc/install#testing)

## Install `drive` a Google Drive Client for commandline

[`drive`](https://github.com/odeke-em/drive#installing) is a command line client using Go language

Add the GOPATH to `.bashrc`

```
cat << ! >> ~/.bashrc
  export GOPATH=\$HOME/gopath
  export PATH=\$GOPATH:\$GOPATH/bin:\$PATH
  !
source ~/.bashrc # To reload the settings and get the newly set ones # Or open a fresh terminal
```

Install `drive` using `go`

```
go get -u github.com/odeke-em/drive/cmd/drive
```

### Initialize `drive` with your Google account

```
mkdir ~/gdrive
drive init ~/gdrive
```

Follow the instructions for copying and pasting the html for authentication

Test your installation

```
drive ls
```
# Pull data from your Google.drive account onto the VM

```
drive pull your/google/drive/folders/here
```
