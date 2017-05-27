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


# DJI Osmo videos 

Concurrent to the DJI Phantom 3/4 flights I walked along each transect of the study area taking 4k videos using a gimbal stabilized DJI Osmo.

The Osmo was held overhead approximately nadir and at 4 oblique angles, roughly 25 degrees down and 45 degrees off the path of travel facing in toward the transect. 

The elevation of the Osmo was ~ 2.5 - 3.5 meters above ground level.

## Video decomposition

I used [`ffmpeg`](https://ffmpeg.org/) to convert the .mp4 and .avi files to JPEG images

```
ffmpeg -i myvideo.avi -qscale:v 2 -vf fps=3 img%03d.jpg
```

where `fps=3` creates an image rate of 3 frames a second (we shot our 4k video at 24 and 30 fps).

We do not need to extract all 24 frames per second of film. The rate of frame extraction should be consistent with an 80%-85% overlap between neighboring images to ensure successful alignment of images in the sfm program.  

I use `%03d` to add the number of images, here I am trying to keep my images under 1,000 per video.

`-qscale:v 2` renders the highest quality `.jpg`

## Editing exported .jpg EXIF 

I wanted to add the camera information from the Sony a6000 back into the exported .jpgs created by FFmpeg. 

