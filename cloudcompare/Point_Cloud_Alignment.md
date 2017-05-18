# CloudCompare Project .bin files

Each study area is saved as a binary (*\*.bin*) file with all of the available point clouds.

|Location|Types|# Point clouds|File size|Link|
|--------|-----|--------------|---------|----|
|Kendall Grassland|sUAS lidar, ALS, TLS, UAS SfM|6|1.7 Gb|[CyVerse DataStore](http://de.cyverse.org/dl/d/F7FFCD8F-04A3-4157-A7F4-B10B7D7A1581/kendall_frontiers_aoi_project1.bin)|
|Lucky Hills Shrubland|sUAS lidar, TLS, UAS SfM|4|2.7 Gb|[CyVerse DataStore](http://de.cyverse.org/dl/d/741A4C61-33F0-4F5E-B017-6F10F81F4ED6/luckyhills_frontiers_project_aoi1.bin)|
|Santa Rita Grazing|ALS, TLS, sUAS SfM|5|5 Gb|[CyVerse DataStore]()|

## Ground Control 

At both the WGEW and SRER the Riegl VZ-400 terrestrial laser scanner 
used reflective 1.5 meter (m) tall laser targets placed atop 
ground control points (GCP)(rebar pins) whose locations were 
established from TotalStation survey from back azimuth to USGS 
benchmarks or Trimble RTK-GPS.

In the Kendall Grassland and Lucky Hill Shrubland the reflective laser targets 
were placed atop at least five rebar stakes, whose locations were established 
from USGS benchmarks and back azimuth measured from a TotalStation.

At the SRER woodland site GCPs were placed throughout the survey area 
using rebar stakes. For the SfM 20cm black and white circular targets
were placed over the center of each pin. Pins were later geolocated using
a Trimble RTK-GPS.

The terrestrial SfM from the Sony a6000 and DJI Osmo did not use any 
onboard GPS. 
The geolocations were referenced from the GCPs which were visible in point
clouds or features referenced from other point clouds (TLS, sUAS), 
typically at least two GCPs were visible per terrestrial sfm cloud. In cases
where GCPs were not visible, large embedded features like cobbles, road marks, 
fence posts, or woody snags and stumps were used.

### Aerial lidar

|Location|Date|Projection|ESPG|RMSE_z [cm]|RMSE_h [cm]|GCP|GCP RMSE [cm]|PPSM (p/m^2)|
|--------|----|----------|----|-----------|-----------|---|-------------|------------|
|Kendall Grassland|9/20/2015|WGS84 UTM Zone 12N|32612|&plusmn;0.096|&plusmn;1.0|||8-16|
|Lucky Hills Shrubland|9/20/2015|WGS84 UTM Zone 12N|32612|&plusmn;0.096|&plusmn;1.0|||8-16|
|Santa Rita Experimental Range|4/20/2011|Arizona Central State Plane (Int. Feet)|2868|&plusmn;0.264|&plusmn;1.0|||8-12|

### SfM

The eBee used onboard GPS for positioning the point cloud; 
without ground control the output cloud was over 30 meters 
lower than the ALS or TLS lidar point clouds.

eBee GPS used WGS84 in Latitude and Longitude, while the other 
datasets use UTM. To change I used a PDAL pipeline reproject.json:

```
$ docker run -v ${PWD}:/data pdal/pdal:1.5 pdal pipeline /data/reprojection.json
$ sudo chown ${USER}:${USER} ebee_utm.las
```
```
{
  "pipeline":[
    {
      "filename":"/data/ebee_multispec_ultra_mild.las",
      "type":"readers.las",
      "spatialreference":"EPSG:4326"
    },
    {
      "type":"filters.reprojection",
      "in_srs":"EPSG:4326",
      "out_srs":"EPSG:32612"
    },
    {
      "type":"writers.las",
      "scale_x":"0.0001",
      "scale_y":"0.0001",
      "scale_z":"0.0001",
      "offset_x":"auto",
      "offset_y":"auto",
      "offset_z":"auto",
      "filename":"/data/ebee_utm.las"
    }
  ]
}
```


|sUAS|Location|Date|Projection|ESPG|RMSE_z [cm]|RMSE_h [cm]|GCP|GCP RMSE [cm]|PPSM (p/m^2)|
|----|--------|----|----------|----|-----------|-----------|---|-------------|------------|
|ebee|Kendall Grassland|9/20/2015|WGS84|4326|&plusmn;0.096|&plusmn;1.0|||8-16|
|ebee|Lucky Hills Shrubland|9/20/2015|WGS84|4326|&plusmn;0.096|&plusmn;1.0|||8-16|
|Phantom4|SRER|8/24/2016|WGS84 UTM Zone 12N|32612|
|Firefly6|SRER|6/28/2016|N/A|N/A|

### Terrestrial laser scanning
The TLS models were georeferenced in [Riegl RiScan software](http://www.riegl.com/products/software-packages/)

|Location|Date|Projection|ESPG|RMSE_z [cm]|RMSE_h [cm]|GCP|GCP RMSE [cm]|PPSM (p/m^2)|
|--------|----|----------|----|-----------|-----------|---|-------------|------------|
|Lucky Hills|?|WGS84 UTM Zone 12N|26912|&plusmn;1|&plusmn;2|TotalStation|??|
|Kendall Grassland|9/24/2015|WGS84 UTM Zone 12N|26912|&plusmn;1|&plusmn;2|TotalStation|??|
|Kendall Grassland|10/9/2015|WGS84 UTM Zone 12N|26912|&plusmn;1|&plusmn;2|TotalStation|??|
|Santa Rita Woodland|8/25/2016|WGS84 UTM Zone 12N|26912|&plusmn;1|&plusmn;2|dGPS|??|
|Santa Rita Woodland|9/30/2016|WGS84 UTM Zone 12N|26912|&plusmn;1|&plusmn;2|dGPS|??|

### GPS and IMU integrations

Lidar from moving platforms requires an integrated GNSS/IMU (Global Navigation Satellite System/Inertial Motion Unit). GNSS(GPS) and IMU provide the position, rotation, and motion of the scanning platform. Depending on the system used there are variable quantities of uncertainty (error) associated with the measurement location. 

The sUAS use small relatively cheap GNSS units, such as the [ublox](https://www.u-blox.com/en/product/neo-m8-series) and standard [DJI](https://www.dji.com/phantom-4/info)

|sUAS|GPS|Satellite systems|GPS uncertainty (z)|GPS uncertainty (h)|Obs uncertainty (z)|Obs uncertainty (h)| 
|----|---|-----------------|-------------------|-------------------|-------------------|-------------------|
|Firefly6|[ublox NEO-M8N](https://www.u-blox.com/sites/default/files/NEO-M8_DataSheet_(UBX-13003366).pdf)| GPS/GLONASS| ±3.0 m | ±2.0 m |NA|NA|
|DJI Phantom4||GPS/GLONASS|&plusmn;0.5 m |&plusmn;1.5 m|&plusmn;0.1 m|&plusmn;0.3 m|
|DJI Phantom3||GPS/GLONASS|&plusmn;0.5 m |&plusmn;1.5 m|&plusmn;0.1 m|&plusmn;0.3 m|
|ServiceDrone||GPS/GLONASS|||||
|eBeeAg|?|?|||||

# M3C2

The Multiscale Model to Model Cloud Comparison (M3C2)([Lague et al. 2013](https://geosciences.univ-rennes1.fr/IMG/pdf/Accurate_3D_point_cloud_comparison_Lague_et_al-_revised_with_figures_feb2013.pdf)): 
* operates directly on point clouds without meshing or gridding.
* computes the local distance between two point clouds along the normal surface direction
* estimates for each distance measurement a confidence interval depending on point cloud roughness and registration error.

We use M3C2 to evaluate the absolute differences in the horizontal, vertical, and multiscale between point clouds in CloudCompare (v2.9.1).

### Outlier Removal

I created PDAL pipelines to remove vertical outliers and to establish 
height above ground (hag) for each of the point clouds.

PDAL uses .json files for executing pipelines.

[filters.mad](https://www.pdal.io/stages/filters.mad.html)

# Alignment and Registration

[CloudCompare Wiki Alignment and Registration](http://www.cloudcompare.org/doc/wiki/index.php?title=Alignment_and_Registration)

Point clouds projected in different datums and geoids can have 
significant misalignments (not necessarily errors). When I first load 
each point cloud into Cloud Compare I can see they do not line up exactly.

Are these misalignent 'measurement error'? Not really. 

For point clouds that were already projected, I used the Rotate/Translate axis alignment 
tool to move the clouds in the x,y, and z axis. If the point clouds have similar
point density and features, e.g. aerial lidar and sUAS eBee SfM, I use 
CloudCompare's fine registration with ICP.

I used the finely align two point cloud tool and "3-point picking" to align 
the SfM point clouds from the Firefly6 to the reference TLS scans from the Reigl.

In the case of the DJI Phantom 4 black and white targets were placed on the dGPS pins.

An easy way to align very large clouds is to create a clone of the data 
and then clip out a smaller transect. Using any of the above methods you align
the point cloud and then copy/paste the resultant transformation to clipboard.
You then click '[Edit > Apply Transformation](http://www.cloudcompare.org/doc/wiki/index.php?title=Apply_Transformation)' and 
paste the transform of the cloned transect.

Note: when working with exceptionally large point clouds (50-100 Gb in RAM) be sure to save often!.

### Display in Entwine/Potree/Greyhound

After finishing the analyses I used Entwine to create web browser viewable data.

```
docker run -it -v ${PWD}:/data connormanning/entwine build -i /data/plot4_all_nadir_shutter_correction.las -o ~/entwine/plot4_all_nadir
```

```
docker run -it -v ~/entwine:/entwine -p 8080:8080 connormanning/greyhound
```

