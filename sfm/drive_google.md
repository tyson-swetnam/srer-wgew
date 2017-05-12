# Getting files from your Drive.Google into a Jetstream VM

In the US, academic institutions have increasingly established email accounts through Google.
Some institutions have unlimited [Drive](https://drive.google.com) storage 
as a service for faculty and students, as was the case for our study.

One of the issues with uploading / downloading a large number of images to or from a Drive 
account through the web browser (i.e. Google's Chrome) is the limit to the number of files, 
the speed of the uploads, and the size of the downloads. Typically a download directly from a 
Drive account through Chrome is limited to <2Gb and is zipped by Google before starting.

While the browser can work well for uploading a large number sUAS images fro ma collection,
downloading a large number of images as .zip files from the Google.drive can be tiresome and difficult.

To get around these problems we can use 3rd party applications like [`drive`](https://github.com/odeke-em/drive) a command line client 
written in Google's own `go` language.

## Install `Go` 

Drive uses the `go` language. In order to work with it you need to [install `go`](https://golang.org/doc/install) onto the VM.

Remove any other go packages (particularly gccgo-go)

```
sudo apt-get -y autoremove gccgo-go
```

```
$ wget https://storage.googleapis.com/golang/go1.8.1.linux-amd64.tar.gz
```

```
$ sudo tar -C /usr/local -xzf go1.8.1.linux-amd64.tar.gz
```

In `/etc/profile` add: `export PATH=$PATH:/usr/local/go/bin`

In `~/.bashrc` - `sudo nano ~/.bashrc`

add to the end of the file:  
```
export GOPATH=$HOME/go
export PATH=$GOPATH:$GOPATH/bin:$PATH
```

Or Add the GOPATH directly from terminal:

```
cat << ! >> ~/.bashrc
export GOPATH=\$HOME/go
export PATH=\$GOPATH:\$GOPATH/bin:\$PATH
!
```
```
source ~/.bashrc # To reload the settings and get the newly set ones # Or open a fresh terminal
```


Follow the `go`instructions to [test the installation](https://golang.org/doc/install#testing)

## Install `drive` a drive.google client for commandline

[`drive`](https://github.com/odeke-em/drive#installing) is a command line client using Go language

Install `drive` using `go`

```
#install git
sudo apt-get install git
```

```
cd ~/go
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
