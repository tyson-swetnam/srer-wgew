# Structure from Motion

### sUAS sfm 

SRER sUAS models were georeferenced based on the GCPs established with the [Leica dGPS]()

|sUAS|Location|Date|Projection|ESPG|RMSE_z [cm]|RMSE_h [cm]|GCP|GCP RMSE [cm]|PPSM (p/m^2)|
|----|--------|----|----------|----|-----------|-----------|---|-------------|------------|
|Sensefly eBee Ag|Lucky Hills|10/8/2015|WGS84 UTM Zone 12N|26912|&plusmn;25cm?|&plusmn;50cm?|None| |
|Sensefly eBee Ag|Kendall Grassland|10/8/2015|WGS84 UTM Zone 12N|26912|&plusmn;25cm?|&plusmn;50cm?|None| | 
|DJI Phantom4|Santa Rita Woodland|8/17/2016|WGS84 UTM Zone 12N|26912|&plusmn;??|&plusmn;??|dGPS| |
|DJI Phantom4|Santa Rita Woodland|9/28/2016|WGS84 UTM Zone 12N|26912|&plusmn;??|&plusmn;??|dGPS| |
|BirdseyeView Firefly6|Santa Rita Woodland|3/17/2016|WGS84 UTM Zone 12N|26912|&plusmn;??|&plusmn;??|dGPS| |
|BirdsEyeView Firefly6|Santa Rita Woodland|6/28/2016|WGS84 UTM Zone 12N|26912|&plusmn;??|&plusmn;??|dGPS| |


We used a combination of several software programs to generate the structure from motion (sfm) point clouds used in this study.

## [Agisoft Photoscan details](https://github.com/tyson-swetnam/lidar_sfm_data_fusion/blob/master/sfm/agisoft_photoscan.md)

## [Web OpenDroneMap details](https://github.com/tyson-swetnam/lidar_sfm_data_fusion/blob/master/sfm/web_odm.md)

## [File Transfer](https://github.com/tyson-swetnam/lidar_sfm_data_fusion/blob/master/sfm/drive_google.md)

Use 3rd party open-source *drive* program to move sUAS imagery from `drive.google.com` to localhost (GPU workstations) and Jetstream VMs.
