## Lidar data 

Prior to doing point cloud comparisons I ran a few preliminary filters to clean up the delivered aerial lidar data. 

The SRER lidar data, as delivered, were in alternate projections to the TLS and sfm point clouds and contained 'outlier' points - often identified by the vendor as 'class 6' in the LAS specification.

The WGEW lidar contained outliers which needed to be filtered. The WGEW data are in LAS 1.4 which uses different file structure and requires updated software for reading.


### Aerial Lidar Projection and instrument uncertainty

The values provided below are mostly from the vendor reports which used known surfaces (e.g. runways) and ground control surveys to establish uncertainty. In the case of the sUAS Velodyne 32, [Sankey et. al. (2017)](http://onlinelibrary.wiley.com/doi/10.1002/rse2.44/full) reported the RMSE for the instrument over WGEW.

##### Table: aerial lidar details and instrument uncertainty (GPS + IMU).  

|Location|Date|LAS version|Projection|ESPG|RMSE_z [cm]|RMSE_h [cm]|GCP|GCP RMSE [cm]|PPSM (p/m^2)|
|--------|----|-----------|----------|----|-----------|-----------|---|-------------|------------|
|[WGEW](https://github.com/tyson-swetnam/lidar_sfm_data_fusion/blob/master/lidar/wgew_2015_lidar_ftp.txt)|9/16-18/2015|1.4|WGS84 UTM Zone 12N|26912|&plusmn;9.6|&plusmn;100|8 - 12||
|[SRER](https://github.com/tyson-swetnam/lidar_sfm_data_fusion/blob/master/lidar/srer_2011_lidar_ftp.txt)|4/10/2011|1.2|NAD83 State Plane HARN Arizona Central, NAVD88|2223|&plusmn;6.4|&plusmn;100|8 - 13 |
|[Lucky Hills Velodyne 32]()|10/8/2015|1.2|WGS84 UTM Zone 12N|26912|&plusmn;169|&plusmn;|NA|NA|37|
|[Kendall Grassland Velodyne 32]()|10/8/2015|1.2|WGS84 UTM Zone 12N|26912|&plusmn;89|&plusmn;|NA|NA|35|
