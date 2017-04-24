# Agisoft Photoscan 

We used Agisoft Photoscan v1.3 ([Agisoft 2016](http://www.agisoft.com/)) to process our aerial
imagery into 3D point clouds and 2D orthomosaics.

# Hardware

We used an Intel dual core XEON E5 v3 2630 Supermiccro workstation with 256GB RAM and 
two NVIDIA 1080GTX GPUs running Microsoft Windows 10.
We also used an Intel i7 6900k micro ATX with 128 GB RAM and two NVIDIA 1080GTX GPUs 
running Ubuntu 16.04.

For the largest sfm model runs (8000+ images) the XEON dual core with 256 GB RAM was 
required due to RAM limitations within Agisoft.



## Digital Camera Specifications
|Camera|Sony a6000|DJI Phantom3|DJI Phantom4|DJI Osmo x3|DJI Osmo x5|
|------|----------|------------|------------|-----------|-----------| 
|Sensor size|Exmor® APS-C type (23.5 x 15.6 mm)|Sony EXMOR 1/2.3" CMOS|Sony EXMOR 1/2.3" CMOS|Sony EXMOR 1/2.3" CMOS|4/3-inch CMOS sensor| 
|Effective Sensor Resolution (megapixel)|24.3|12|
|Resolution|6000x4000|4000x3000|4000x3000|4000x3000| | 
|HD Video|| | | | | 
|FOV||90°|94°|94°|72°| 

*Note: FOV = Field of View* 

## Camera Settings
|Camera|Sony a6000|DJI Phantom3|DJI Phantom4|DJI Osmo x3|DJI Osmo x5|
|------|----------|------------|------------|-----------|-----------| 
|Format| | | | | | 
|ISO|| | | | | 
|White Balance|| | | | | 
|Exposure Metering|| | | | | 
Exposure compensation|| | | | | 
|Sharpness|| | | | | 
|Antiflicker|| | | | | 

## Agisoft Settings
|Parameter|Setting|Value|
|---------|-------|-----|
|Camera Calibration| | |
|Rolling Shutter Correction||on|
|Align Photos|Accuracy|High|
|Align Photos|Pair preselect| |
|Align Photos|Key Points|default|
|Align Photos|Tie Points|default|
|Build Dense|Quality|Ultra High & High|
|Build Dense|Depth filter|Mild|
|Build Mesh|Surface Type|Height|
|Build Mesh|Face Count||
Build Mesh|Interpolation| |

