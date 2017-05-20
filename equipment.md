# Hardware

We used an Intel dual core XEON E5 v3 2630 Supermicro workstation with 256GB RAM and 
two NVIDIA 1080GTX GPUs running Microsoft Windows 10.
We also used an Intel i7 6900k micro ATX with 128 GB RAM and two NVIDIA 1080GTX GPUs 
running Ubuntu 16.04.

For the largest sfm model creation (>500 images) chunking of individual flights was used to 
keep the RAM use beneath the available amount. 

## Digital Camera Specifications
|Camera|[Sony a6000 w/ Zeiss Sonar \*T 35mm](http://www.sony.com/electronics/interchangeable-lens-cameras/ilce-6000-body-kit)|[DJI Phantom-3](http://www.dji.com/phantom-3-pro/info)|[DJI Phantom-4](http://www.dji.com/phantom-4/info)|[DJI Zenmuse x3](http://www.dji.com/zenmuse-x3/info)|[DJI Zenmuse x5](http://www.dji.com/zenmuse-x5/info)|
|------|----------|------------|------------|-----------|-----------| 
|Sensor (mm)|Sony EXMOR APS-C (23.5x15.6)|Sony EXMOR 1/2.3" (6.3x4.72)|Sony EXMOR 1/2.3" (6.3x4.72)|Sony EXMOR 1/2.3" (6.3x4.72)|Panasonic Micro 4/3" (17.3x13)| 
|Effective Sensor Resolution (megapixel)|24.3|12|12|12|16|
|Lens|35 mm|20mm (35 mm equivalent)|20mm (35 mm equivalent)|20mm (35 mm equivalent)|30 mm|
|Still image resolution|6000x4000|4000x3000|4000x3000|4000x3000|4608x3456| 
|Video resolution|1920x1080 (1080p)|3840x2160(4k)|3840x2160(4k)|3840x2160(4k)|3840x2160(4k)| 
|FOV|62°|90°|94°|94°|72°| 

*Note: FOV = Field of View* 

## Camera Settings
|Camera|Sony a6000|DJI Phantom-3|DJI Phantom-4|DJI Zenmuse x3|DJI Zenmuse x5|
|------|----------|-------------|-------------|--------------|--------------| 
|Format|JPG & RAW|JPG|JPG|JPG|JPG| 
|ISO|100-1600|100-1600|100-1600|100-1600|100-1600|
|F-stop|||||||
Exposure||||||||
|Focus|1-∞|∞|∞|∞|∞|
|White Balance|Sun|Sun|Sun|Sun|Sun| 
|Exposure Metering|Center|Center|Center|Center|Center| 
Exposure compensation|0|0|0|0|0| 
|Sharpness| | | | | | 
|Antiflicker| | | | | | 

## Flight / Collection Parameters

*agl* = above ground level
*m/s* = meters per second (forward air speed)
The Sony a6000 was flown on the [BirdsEyeView Firefly6](https://www.birdseyeview.aero/), the [DJI Osmo](http://www.dji.com/osmo/info) was carried by hand on an extensible 1 meter rod.

|Camera|Sony a6000|DJI Phantom-3|DJI Phantom-4|DJI Osmo x3|DJI Osmo x5|
|------|----------|------------|------------|-----------|-----------| 
|Flight Height (*m agl*)|100-120|20-30|20-30|1-3|1-3|
|Forward speed(*m/s*)|15-18|4|4|1|1|
|Forward overlap (%)|80|85|85|>90|>90|
|Side overlap (%)|~80|85|85|>90|>90|
|Obliquity (&deg;)|0-15|30|30|20-45|20-45|
|Estimated pixel size (*mm*)|25-50|11|11|<1|<1|

