# Background

This repository contains quickstart tutorials, brief explanations, and code addendums. The data are linked to [CyVerse DataCommons](http://datacommons.cyverse.org/) and national data repositories.

##### Frontiers in Plant Ecology: Optical approaches to remote sensing ([Swetnam et al. (2018)]())

## [Jetstream](https://github.com/tyson-swetnam/lidar_sfm_data_fusion/tree/master/jetstream)

[Jetstream Quickstart](https://github.com/tyson-swetnam/lidar_sfm_data_fusion/tree/master/jetstream)

These scripts were run on [Jetstream](https://jetstream-cloud.org/) cloud resources with different [base images](https://use.jetstream-cloud.org/application/images/54) and [custom images](https://use.jetstream-cloud.org/application/images/330) images using Docker, GRASS and GDAL GIS, R and RStudio.

Software used in this study are built in [Docker](https://www.docker.com/). I installed Docker CE on the base Ubuntu Dev image provided by Jetstream, [image here](https://use.jetstream-cloud.org/application/images/359). New instances are launched from this image and `docker pull` installs the containers for analyses.

We used [iRODS iCommands](https://pods.iplantcollaborative.org/wiki/display/DS/Setting+Up+iCommands) to move our data from our local machines onto the CyVerse Data Store, and then onto the Jetstream VMs. We also used [Drive](https://github.com/odeke-em/drive) a command line interface for `drive.google.com` to move archived imagery data from the sUAS onto the CyVerse DataStore and VMs. 

## [University of Arizona HPC](https://github.com/tyson-swetnam/lidar_sfm_data_fusion/tree/master/uahpc)

We used the University of Arizona's High Performance Computer with GPU, called *El Gato*, to run [Agisoft Photoscan](http://www.agisoft.com/) in a distributed interface (master + worker nodes). 

## Software 

### Docker containers

[PDAL](https://www.pdal.io/) Version 1.5

[Entwine](https://entwine.io/) Version 1.0

[QGIS](https://github.com/kartoza/docker-qgis-desktop) Version 2.14 LTR

### [CloudCompare](https://github.com/tyson-swetnam/lidar_sfm_data_fusion/tree/master/cloudcompare)

[CloudCompare quickstart](https://github.com/tyson-swetnam/lidar_sfm_data_fusion/tree/master/cloudcompare)

We installed [CloudCompare](http://www.danielgm.net/cc/) Version 2.9.1 using [Snap](https://snapcraft.io/docs/core/install)

### OSGEO

The custom Jetstream image uses GDAL 2.1 and GRASS 7.2 built from [source](https://grasswiki.osgeo.org/wiki/Compile_and_Install).

*QGIS was run using the Docker container from [Kartoza](https://github.com/kartoza/docker-qgis-desktop)*

### Open Drone Map

[Web Open Drone Map](https://github.com/OpenDroneMap/WebODM)

### Agisoft

[Photoscan Pro](http://www.agisoft.com/) Version 1.3


