# Agisoft Photoscan 

We used Agisoft Photoscan v1.3 ([Agisoft 2016](http://www.agisoft.com/)) to process our aerial
imagery into 3D point clouds and 2D orthomosaics.

[UNAVCO guide to using Agisoft Photoscan v1.2](http://kb.unavco.org/kb/file.php?id=781) - this link downloads a PDF.

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

## DJI Phantom 3/4

The DJI Phantom was flown using [Altizure](https://www.altizure.com/) mission planning software. the Phantom GPS was used for initially geolocating the imagery in Agisoft. After the sparse point cloud was generated a ground control point file, generated from the Trimble RTK-GPS was used to geolocate the coordinates on the ground. 

The sUAS flew 20-25 m above ground level yielding spatial resolution of 8-10 mm and image footprints of 31 m x 23 m The flight parameters.

|Parameters|scalars|
|----------|-------|
|Forward lap|75 %|
|Side lap|80 %|
|Speed| 4-5 m/s|
|Oblique angle|30-43%|
|Mission times| 7-10 minutes |
|Missions per plot|5|
|Flight time per plot|15-20|
|Battery reserve|20-25|


## DJI Osmo Zenmuse x3/x5

4k videos were shot with the Osmo facing nadir, forward, and lateral oblique angles along transects in the SRER. 
Still frames from the videos were extracted using [ffmpeg](https://github.com/tyson-swetnam/lidar_sfm_data_fusion/blob/master/sfm/osmo_video_edit.md#dji-osmo-videos)
Different frame rate extraction speeds were tested. The final models used between 3 and 6 frames per second (fps) (from a nominal rate of 24 fps).
