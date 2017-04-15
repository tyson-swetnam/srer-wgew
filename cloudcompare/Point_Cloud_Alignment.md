# Justification

In both the WGEW and SRER sites the terrestrial laser scanner 
was set up using bench marked locations from RTK-GPS.

In Kendall Grassland and Lucky Hill Shrubland the TLS targest 
were placed on total station pins which were established 
from USGS benchmarks.

The TLS models were georeferenced in [Riegl RiScan software](http://www.riegl.com/products/software-packages/)

|Location|RMSE|control points|
|--------|----|--------------|
|Lucky Hills|||
|Kendall Grassland|||
|Santa Rita Savannah|||
|Santa Rita Woodland|||

The sUAS use small GPS units, such as the [ublox](https://www.u-blox.com/en/product/neo-m8-series) and [DJI Phantom4](https://www.dji.com/phantom-4/info)

|sUAS|GPS|Satellite systems| (GPS) Vertical uncertainty | (GPS) Horizontal uncertainty | (Vision) Vertical uncertainty | (Vision) Horizontal uncertainty | 
|----|---------|-----------------|--------------------------|----------------------------|-----------------------------|-------------------------------|
|Firefly6| [ublox NEO-M8N](https://www.u-blox.com/sites/default/files/NEO-M8_DataSheet_(UBX-13003366).pdf)| GPS/GLONASS| ±3.0 m | ±2.0 m |NA|NA|
|DJI Phantom4||GPS/GLONASS|±0.5 m |±1.5 m|±0.1 m|±0.3 m|
|DJI Phantom3||GPS/GLONASS|±0.5 m |±1.5 m|±0.1 m|±0.3 m|
|ServiceDrone|||||||
|eBeeAg|||||||

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