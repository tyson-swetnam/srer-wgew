# Input Point Clouds

At both the WGEW and SRER sites the Riegl terrestrial laser scanner 
was set up using reflective targets placed atop ground control 
rebar pins whose locations were established from either TotalStation 
survey or RTK-GPS.

In Kendall Grassland and Lucky Hill Shrubland reflective laser targets 
were placed on five rebar stakes whose locations were established 
from USGS benchmarks and back azimuth measured from a TotalStation.

At the SRER woodland site ground control pins were placed throughout
the survey area (13 rebar stakes) and located using RTK-GPS.

The terrestrial sfm from the Sony a6000 and DJI Osmo did not use GPS. 
Their locations were referenced from the GCPs visible in the processed 
clouds or features referenced in other point clouds (TLS, sUAS), 
typically only one to two GCPs were visible per terrestrial sfm cloud.

### Aerial Lidar

|Location|Date|Projection|ESPG|RMSE_z [cm]|RMSE_h [cm]|GCP|GCP RMSE [cm]|PPSM (p/m^2)|
|--------|----|----------|----|-----------|-----------|---|-------------|------------|
|WGEW|9/16-18/2015|WGS84 UTM Zone 12N|26912|&plusmn;9.6|&plusmn;100|8 - 12||
|SRER|4/10/2011|NAD83 State Plane HARN Arizona Central, NAVD88|2223|&plusmn; 6.4|&plusmn;100|8 - 13 ||
|Lucky Hills Velodyne 32|10/8/2015|WGS84 UTM Zone 12N|26912|&plusmn;|&plusmn;|NA|?|?|
|Kendall Grassland Velodyne 32|10/8/2015|WGS84 UTM Zone 12N|26912|||&plusmn;|NA|?|?|

### sUAS sfm 

SRER sUAS models were georeferenced based on the GCPs established with the [Leica dGPS]()

|sUAS|Location|Date|Projection|ESPG|RMSE_z [cm]|RMSE_h [cm]|GCP|GCP RMSE [cm]|PPSM (p/m^2)|
|----|--------|----|----------|----|-----------|-----------|---|-------------|------------|
|Sensefly eBee Ag|Lucky Hills|10/8/2015|WGS84 UTM Zone 12N|26912|&plusmn;25cm?|&plusmn;50cm?|None| |
|Sensefly eBee Ag|Kendall Grassland|10/8/2015|WGS84 UTM Zone 12N|26912|&plusmn;25cm?|&plusmn;50cm?|None| | 
|DJI Phantom4|Santa Rita Woodland|8/17/2016|WGS84 UTM Zone 12N|26912|&plusmn;??|&plusmn;??|dGPS| |
|DJI Phantom4|Santa Rita Woodland|9/28/2016|WGS84 UTM Zone 12N|26912|&plusmn;??|&plusmn;??|dGPS| |
|BirdseyeView Firefly6|Santa Rita Woodland|3/17/2016|?|||||||
|BirdsEyeView Firefly6|Santa Rita Woodland|6/28/2016|

### Terrestrial laser scanning
The TLS models were georeferenced in [Riegl RiScan software](http://www.riegl.com/products/software-packages/)

|Location|Date|Projection|ESPG|RMSE_z [cm]|RMSE_h [cm]|GCP|GCP RMSE [cm]|PPSM (p/m^2)|
|--------|----|----------|----|-----------|-----------|---|-------------|------------|
|Lucky Hills|?|WGS84 UTM Zone 12N|26912|&plusmn;1|&plusmn;2|TotalStation|??|
|Kendall Grassland|10/9/2015|WGS84 UTM Zone 12N|26912|&plusmn;1|&plusmn;2|TotalStation|??|
|Santa Rita Woodland|8/25/2016|WGS84 UTM Zone 12N|26912|&plusmn;1|&plusmn;2|dGPS|??|
|Santa Rita Woodland|9/30/2016|WGS84 UTM Zone 12N|26912|&plusmn;1|&plusmn;2|dGPS|??|

### Terrestrial sfm
|Location|Camera|Date|Projection|ESPG|RMSE_z [cm]|RMSE_h [cm]|GCP|GCP RMSE [cm]|PPSM (p/m^2)|
|--------|------|----|----------|----|-----------|-----------|---|-------------|------------|
|SRER Opuntia|a6000|
|SRER Mesquite|a6000|
|SRER Mesquite|Osmo|
|SRER Grasses|a6000|
|SRER plot 4|DJI Osmo||
|SRER plot x|DJI Osmo||

### Ground Control

|Dataset|Type|RMSE|
|-------|----|----|
|Lucky Hills|Total Station||
|Kendall Grassland|Total Station||

|Dataset|Type|RMSE|
|-------|----|----|
|Santa Rita Woodland|dGPS||

### GPS and IMU integrations

Lidar from moving platofmrs requires an integrated GNSS/IMU (Global Navigation Satellite System/Inertial Motion Unit). GNSS(GPS) and IMU provide the position, rotation, and motion of the scanning platform. Depending on the system used there are variable quantities of uncertainty (error) associated with the measurement location. 

The sUAS use small relatively cheap GNSS units, such as the [ublox](https://www.u-blox.com/en/product/neo-m8-series) and standard [DJI](https://www.dji.com/phantom-4/info)

|sUAS|GPS|Satellite systems| (GPS) Vertical uncertainty | (GPS) Horizontal uncertainty | (Vision) Vertical uncertainty | (Vision) Horizontal uncertainty | 
|----|---------|-----------------|--------------------------|----------------------------|-----------------------------|-------------------------------|
|Firefly6| [ublox NEO-M8N](https://www.u-blox.com/sites/default/files/NEO-M8_DataSheet_(UBX-13003366).pdf)| GPS/GLONASS| ±3.0 m | ±2.0 m |NA|NA|
|DJI Phantom4||GPS/GLONASS|&plusmn;0.5 m |&plusmn;1.5 m|&plusmn;0.1 m|&plusmn;0.3 m|
|DJI Phantom3||GPS/GLONASS|&plusmn;0.5 m |&plusmn;1.5 m|&plusmn;0.1 m|&plusmn;0.3 m|
|ServiceDrone||GPS/GLONASS|||||
|eBeeAg|?|?|||||


### Reprojection

I reprojected all of the point clouds to WGS84 Web Mercator (EPSG: 3857)

SRER PAG 2011

```
docker run -v ${PWD}:/data pdal/pdal:1.5 pdal translate \
/data/pag11/srer_mad.las /data/pag11/srer_mad_wgs84.las reprojection \
--filters.reprojection.out_srs="EPSG:4326" \
--writers.las.scale_x=0.0000001 \
--writers.las.scale_y=0.0000001 \
--writers.las.offset_x="auto" \
--writers.las.offset_y="auto"
```

WGEW 2015

### Outlier Removal

I created PDAL pipelines to remove vertical outliers and to establish height above ground (hag) for each of the point clouds.

PDAL uses .json files for executing pipelines.

[filters.mad](https://www.pdal.io/stages/filters.mad.html)

```

```

# Alignment of point clouds

Point clouds projected in different datums and geoids can have significant misalignment when they are loaded together.

## Alignment in CloudCompare

I used the finely align two point cloud tool and "3-point picking" to align 
the test point clouds to the reference TLS scans from the Reigl.

The Reigl lidar used targets placed on dGPS pins at SRER. At WGEW the Reigl 
used targets placed on dGPS and TotalStation surveyed pins. 

In the case of the DJI Phantom 4 black and white targets were placed on the dGPS pins.

[Alignment and Registration](http://www.cloudcompare.org/doc/wiki/index.php?title=Alignment_and_Registration)

### Display in Entwine/Potree/Greyhound

After finishing the analyses I used Entwine to create web browser viewable data.

```
docker run -it -v ${PWD}:/data connormanning/entwine build -i /data/plot4_all_nadir_shutter_correction.las -o ~/entwine/plot4_all_nadir
```

```
docker run -it -v ~/entwine:/entwine -p 8080:8080 connormanning/greyhound
```

