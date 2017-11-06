# Agisoft Photoscan 

We used Agisoft Photoscan v1.3 ([Agisoft 2016](http://www.agisoft.com/)) to process our aerial
imagery into 3D point clouds and 2D orthomosaics.

We used: (1) a dual core Intel XEON workstation (32 logical cores) with 256 GB RAM and two NVIDIA GTX1080 graphic processing units (GPU) and (2) single physical core Intel i7 workstation (16 logical cores) with 128 GB RAM and two NVIDIA GTX1080 GPUs for processing SfM in Agisoft Photoscan.

[UNAVCO guide to using Agisoft Photoscan v1.2](http://kb.unavco.org/kb/file.php?id=781) - this link downloads a PDF.

## Python scripting

http://wiki.agisoft.com/wiki/Python

## Agisoft Settings

We used the highest quality settings for generating our point clouds.

|Parameter|Setting|Value|
|---------|-------|-----|
|Camera Calibration||on|
|Rolling Shutter Correction||on|
|Align Photos|Accuracy|High|
|Align Photos|Pair preselect| |
|Align Photos|Key Points|default|
|Align Photos|Tie Points|default|
|Build Dense|Quality|Ultra High & High|
|Build Dense|Depth filter|Mild|
|Build Mesh|Surface Type|Height|
|Build Mesh|Face Count||
|Build Mesh|Interpolation| |
|Build DEM|||
|Build Orthophoto||

## Sensefly eBee Multispec

For the sUAS imagery from the Sensefly eBee we processed the data using the 'multispectral' cameras option. The eBee GPS points were used to geolocate the imagery.

The models used the settings mentioned above for their dense point cloud generation

## DJI Osmo Zenmuse x3/x5

4k videos were shot with the Osmo facing nadir, forward, and lateral oblique angles along transects in the SRER. 
Still frames from the videos were extracted using [ffmpeg](https://github.com/tyson-swetnam/lidar_sfm_data_fusion/blob/master/sfm/osmo_video_edit.md#dji-osmo-videos)
Different frame rate extraction speeds were tested. The final models used between 3 and 6 frames per second (fps) (from a nominal rate of 24 fps).
