# Jetstream Images

For analyzing the sfm point clouds I created several custom images on Jetstream and Atmosphere.

### Ubuntu + Docker CE
The first image is a Jetstream [base Ubuntu 14.04 development XCFE GUI image with iRODS](https://use.jetstream-cloud.org/application/images/54)
to which I've added Docker CE and Docker-Compose

This base image can be used with any other software which has been deployed in Docker.

[Ubuntu dev w/ Docker and Docker-Compose](https://use.jetstream-cloud.org/application/images/359)
minimum size: small 2-core, 4GB RAM.

#### Running Docker

To install any Docker containers simply use the standard `docker pull` command.

```
docker pull pdal/pdal:1.5
```

### Ubuntu + OSGEO

The second image is the same base with [Ubuntu 14.04 with GDAL 2.1 and GRASS 7.2](https://use.jetstream-cloud.org/application/images/330) 
built from source, minimum size: small 2-core, 4GB RAM.

This base image can be used with QGIS.

#### Installing QGIS

### R + RStudio

There are already several Jetstream images available which have R compiled on them.

```
sudo apt-get update
sudo apt-get install r-base 
```


