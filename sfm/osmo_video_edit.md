# Prerequisites

## Install `ffmpeg`

[FFmpeg homepage](https://ffmpeg.org/)

[Install ffmpeg instructions](https://ffmpeg.org/download.html#build-linux)

```
sudo apt-get install ffmpeg ffmpeg-devel
```

```
yum install ffmpeg ffmpeg-devel
```

## Install `exiftool`

[ExifTool Homepage](http://www.sno.phy.queensu.ca/~phil/exiftool/index.html)

[ExifTool Unix install instructions](http://www.sno.phy.queensu.ca/~phil/exiftool/index.html)

* Download latest version of [ExifTool v10.54](http://www.sno.phy.queensu.ca/~phil/exiftool/Image-ExifTool-10.54.tar.gz) to the `/opt/` directory

* Extract the folder

```
 gzip -dc Image-ExifTool-10.54.tar.gz | tar -xf -
    cd Image-ExifTool-10.54
```

* Test Make and Install

```
 perl Makefile.PL
    make test
    sudo make install
```
