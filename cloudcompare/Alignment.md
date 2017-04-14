# Alignment of point clouds

Point clouds projected in different datums and geoids can have significant misalignment when they are loaded together.

### Point Clouds

|Dataset|Projection|ESPG|Point Density (ppsm)|Link|
|-------|----------|----|--------------------|----|
|Woolpert aerial|UTM||8 - 12||
|eBee MultiSPEC |UTM| | ||
|Velodyne 32|UTM||||
|Reigl TLS|UTM|||

|Dataset|Projection|ESPG|Point Density (ppsm)|Link|
|-------|----------|----|--------------------|----|
|SRER aerial|AZ State Plane Central| |8 - 13 ||
|a6000|WGS84||1000+||
|DJI Phantom 4|WGS84||12,000 - 45,000||
|DJI Osmo|WGS84|||
|Reigl TLS|UTM|||

### Ground Control

|Dataset|Type|RMSE|
|-------|----|----|
|Lucky Hills|Total Station||
|Kendall Grassland|Total Station||

|Dataset|Type|RMSE|
|-------|----|----|
|Santa Rita Woodland|dGPS||

## Alignment in CloudCompare

I used the finely align two point cloud tool and "3-point picking" to align 
the test point clouds to the reference TLS scans from the Reigl.

The Reigl lidar used targets placed on dGPS pins at SRER. At WGEW the Reigl 
used targets placed on dGPS and TotalStation surveyed pins. 

In the case of the DJI Phantom 4 black and white targets were placed on the dGPS pins.

[Alignment and Registration](http://www.cloudcompare.org/doc/wiki/index.php?title=Alignment_and_Registration)
