# Getting files from your Drive.Google into an Atmosphere or Jetstream VM

In the US, academic institutions have increasingly established email accounts through Google.
Some institutions have unlimited storage on [Drive](https://drive.google.com)
as a service for faculty and students.

One of the issues with uploading / downloading a large number of images to or from a Drive 
account through the web browser (Chrome or Firefox) is the number of files allowed, 
the speed of the uploads, and the size of the downloads.

Typically a download directly from a Drive account through Chrome is limited to <2Gb 
and is zipped by Google before starting.

While the browser can work well for easily uploading a large number sUAS images from a collection,
downloading the images as .zip files from the Google.drive can become tiresome and difficult.

To get around these problems we can use 3rd party applications like FUSE and
[`drive`](https://github.com/odeke-em/drive).

## FUSE client `ocamfluse`

[`google-drive-ocamlfuse`](https://github.com/astrada/google-drive-ocamlfuse) is a Google Drive Client written in OCaml. This is tested for Ubuntu systems.

It can mount your google drive as a folder visible in the file tree. FUSE is slower than other methods like iRODS or `Drive`, but allows for GUI based drag and drop transfers.

```
sudo add-apt-repository ppa:alessandro-strada/ppa
sudo apt-get update
sudo apt-get install google-drive-ocamlfuse
```

Run the app the first time to get the authentication certificate from Google

```
google-drive-ocamlfuse
```

Create a folder:

```
mkdir ~/googledrive
```
Mount the new googledrive

```
google-drive-ocamlfuse ~/googledrive
```

Open in your favorite file explorer. 

## Install `Go` 

Drive uses the `go` language. In order to work with it you need to [install `go`](https://golang.org/doc/install) onto the VM.

Remove any other go packages (particularly gccgo-go)

```
sudo apt-get -y autoremove gccgo-go
```

```
wget https://storage.googleapis.com/golang/go1.8.1.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.8.1.linux-amd64.tar.gz
```

In `/etc/profile` add: `export PATH=$PATH:/usr/local/go/bin`

```
cat << ! >> /etc/profile
export PATH=$PATH:/usr/local/go/bin
!
```

In `~/.bashrc` - `sudo nano ~/.bashrc`

Add the GOPATH directly from terminal:

```
cat << ! >> ~/.bashrc
export GOPATH=\$HOME/go
export PATH=\$GOPATH:\$GOPATH/bin:\$PATH
!
```

Source the new `~/.bashrc` close the terminal and reopen

```
source ~/.bashrc 
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

## Using Drive on UA HPC

Drive is currently available on the ElGato login node 

Load `go` and `drive`

```
module load go
module load drive
```

Create a directory where you want to initiate `drive` - preferrably on your `/xdisk/`

```
cd /xdisk/uid/
mkdir gdrive
```

Initiate the drive

```
drive init /xdisk/uid/gdrive
```

You will get a request to `Visit this URL to get an authorization code` with a link to a long `https://accounts.google.com/o/oauth2/xxxx` URL - copy paste that link into your preferred browser.

You will be taken to a Google login page, type in your email address (uid@email.arizona.edu) and password. 

Copy/Paste the code provided by Google back in your Terminal window where prompted: `Paste the authorization code:`

Now, check to see if your `drive.google.com` acount is active:

```
drive ls
```
A list of the directories in your `drive.google.com` account should be listed, e.g.

```
/project1
/project2
/reports1
/pictures1
```

You can `pull` files or directories from your `drive.google.com` now using commands like:

```
drive pull project1/subfolder/
```
You will see:

```
Resolving...
```
followed by a spinning `\` `|` `/` `-` set of symbols

The folder contents will be displayed:

```
 /project1/subfolder/file1.csv
...
+ /project1/subfolder/file955.csv
+ /project1/subfolder/file966.csv
Addition count 966 src: 5.02GB
Proceed with the changes? [Y/n]:
```

Select `y` and the download will proceed.

Typical speeds are between 10 and 50 Mb/s.

```
Proceed with the changes? [Y/n]:y
 5392682146 / 5392682146 [==========================================================================================================================] 100.00% 1m55s
```
