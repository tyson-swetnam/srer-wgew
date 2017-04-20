# Input Point Clouds

In both the WGEW and SRER sites the terrestrial laser scanner 
was set up using bench marked locations from RTK-GPS.

In Kendall Grassland and Lucky Hill Shrubland the TLS targest 
were placed on total station pins which were established 
from USGS benchmarks.

### Terrestrial laser scanning
The TLS models were georeferenced in [Riegl RiScan software](http://www.riegl.com/products/software-packages/)

|Location|Date|RMSE [cm]|GCP|GCP RMSE [cm}|
|--------|----|---------|---|-------------|
|Lucky Hills|?|?|TotalStation| |
|Kendall Grassland|10/9/2015|?|TotalStation| |
|Santa Rita Woodland|8/25/2016|?|dGPS| |
|Santa Rita Woodland|9/30/2016|?|dGPS| |

### sUAS sfm 

SRER sUAS models were georeferenced based on the GCPs established with the [Leica dGPS]()

|Location|Date|RMSE [cm]|GCP|GCP RMSE [cm]|
|--------|----|---------|---|-------------|
|Lucky Hills|10/8/2015|XXX|None| |
|Kendall Grassland|10/8/2015|XXX|None| | 
|Santa Rita Woodland|8/17/2016|XXX cm|dGPS| |
|Santa Rita Woodland|9/28/2016|XXX cm|dGPS| |

### lidar

|Dataset|Projection|ESPG|Point Density (ppsm)|Link|
|-------|----------|----|--------------------|----|
|WGEW 2015|UTM|26912|8 - 12||
|SRER 2011|AZ State Plane Central| |8 - 13 ||
|Velodyne 32|UTM||||
|Reigl TLS|UTM|||

|Dataset|Projection|ESPG|Point Density (ppsm)|Link|
|-------|----------|----|--------------------|----|
|a6000|WGS84||1000+||
|DJI Phantom 4|WGS84||12,000 - 45,000||
|DJI Osmo|WGS84|||


|eBee MultiSPEC |UTM| | ||

### Ground Control

|Dataset|Type|RMSE|
|-------|----|----|
|Lucky Hills|Total Station||
|Kendall Grassland|Total Station||

|Dataset|Type|RMSE|
|-------|----|----|
|Santa Rita Woodland|dGPS||

### GPS

The sUAS use small GPS units, such as the [ublox](https://www.u-blox.com/en/product/neo-m8-series) and standard [DJI](https://www.dji.com/phantom-4/info)

|sUAS|GPS|Satellite systems| (GPS) Vertical uncertainty | (GPS) Horizontal uncertainty | (Vision) Vertical uncertainty | (Vision) Horizontal uncertainty | 
|----|---------|-----------------|--------------------------|----------------------------|-----------------------------|-------------------------------|
|Firefly6| [ublox NEO-M8N](https://www.u-blox.com/sites/default/files/NEO-M8_DataSheet_(UBX-13003366).pdf)| GPS/GLONASS| ±3.0 m | ±2.0 m |NA|NA|
|DJI Phantom4||GPS/GLONASS|±0.5 m |±1.5 m|±0.1 m|±0.3 m|
|DJI Phantom3||GPS/GLONASS|±0.5 m |±1.5 m|±0.1 m|±0.3 m|
|ServiceDrone|||||||
|eBeeAg|||||||


### Reprojection

I reprojected all of the point clouds to WGS84 (EPSG: 4326)

Riegl scan 1

```
docker run -v ${PWD}:/data pdal/pdal:1.5 pdal translate \
/data/p4_082516.las /data/p4_082516_wgs84.las reprojection \
--filters.reprojection.out_srs="EPSG:4326" \
--writers.las.scale_x=0.0000001 \
--writers.las.scale_y=0.0000001 \
--writers.las.offset_x="auto" \
--writers.las.offset_y="auto"
```

Riegl scan 2

```
docker run -v ${PWD}:/data pdal/pdal:1.5 pdal translate \
/data/p4_093016.las /data/p4_093016_wgs84.las reprojection \
--filters.reprojection.out_srs="EPSG:4326" \
--writers.las.scale_x=0.0000001 \
--writers.las.scale_y=0.0000001 \
--writers.las.offset_x="auto" \
--writers.las.offset_y="auto"
```

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
docker run -it -v ${PWD}:/data -v /media/tyson/2AFE-A957/frontiers/data:/out connormanning/entwine build -i /data/plot4_all_nadir_shutter_correction.las -o /out/p4
```

```
docker run -it -v ~/entwine:/entwine -p 8080:8080 connormanning/greyhound
```

