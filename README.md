# Background

This repository contains quickstart tutorials, brief explanations, and code addendums to [Swetnam et al. (2018)]() in Frontiers in Plant Science: Optical approaches to remote sensing special issue The data not available on national data repositories are linked to [CyVerse DataCommons](http://datacommons.cyverse.org/).

|Metadata Table List|
|-------------------|
|[Cameras and lenses](https://github.com/tyson-swetnam/lidar_sfm_data_fusion/blob/master/equipment.md#digital-camera-specifications)| 
|[small Unmanned Aerial Systems (sUAS) platforms](https://github.com/tyson-swetnam/lidar_sfm_data_fusion/tree/master/sfm#suas-sfm)|
|[Aerial lidar point clouds](https://github.com/tyson-swetnam/lidar_sfm_data_fusion/blob/master/cloudcompare/Point_Cloud_Alignment.md#aerial-lidar)|
|[Terrestrial lidar point clouds](https://github.com/tyson-swetnam/lidar_sfm_data_fusion/blob/master/cloudcompare/Point_Cloud_Alignment.md#terrestrial-laser-scanning)|
|[sUAS structure from motion (sfm) point clouds](https://github.com/tyson-swetnam/lidar_sfm_data_fusion/blob/master/cloudcompare/Point_Cloud_Alignment.md#suas-sfm)|
|[Handheld sfm point clouds]()|

# Hardware

## [Jetstream](https://github.com/tyson-swetnam/lidar_sfm_data_fusion/tree/master/jetstream)

[Jetstream Quickstart](https://github.com/tyson-swetnam/lidar_sfm_data_fusion/tree/master/jetstream)

These repository scripts were run on [Jetstream](https://jetstream-cloud.org/) cloud resources with different [base images](https://use.jetstream-cloud.org/application/images/54) and [custom images](https://use.jetstream-cloud.org/application/images/330) using a combination of Docker containers and stand alone software compiled from source.

For software which are also built in [Docker](https://www.docker.com/), I installed Docker CE on the base `Ubuntu 14.04 Development` image provided by Jetstream, [image here](https://use.jetstream-cloud.org/application/images/359). New instances could be launched from image with Docker preinstalled using the `docker pull` command.

We used [iRODS iCommands](https://pods.iplantcollaborative.org/wiki/display/DS/Setting+Up+iCommands) to move our data from our local machines onto the CyVerse Data Store, and then onto the Jetstream VMs. We also used [Drive](https://github.com/odeke-em/drive) a command line interface for `drive.google.com` to move archived imagery data from the sUAS onto the CyVerse DataStore and VMs. 

## [University of Arizona HPC](https://github.com/tyson-swetnam/lidar_sfm_data_fusion/tree/master/uahpc)

The University of Arizona's High Performance Computer with GPU, called *El Gato*, was used to run structure from motion modelling in [Agisoft Photoscan](http://www.agisoft.com/) in a distributed interface (master + worker nodes). 

## Desktop Workstations

We used an Intel dual core XEON E5 v3 2630 Supermicro Motherboard Full Tower workstation with 256GB RAM and two NVIDIA 1080GTX GPUs running Microsoft Windows 10. We also used an Intel i7 6900k micro ATX cube with 128 GB RAM and two NVIDIA 1080GTX GPUs running Ubuntu 16.04.

# GIS Software 

## Docker containers

|Software|Version|Date|
|--------|-------|----|
|[PDAL](https://www.pdal.io/)|1.5||
|[Entwine](https://entwine.io/)|1.0||
|[QGIS](https://github.com/kartoza/docker-qgis-desktop)|2.14 LTR||

## [CloudCompare](https://github.com/tyson-swetnam/lidar_sfm_data_fusion/tree/master/cloudcompare)

[CloudCompare quickstart](https://github.com/tyson-swetnam/lidar_sfm_data_fusion/tree/master/cloudcompare)

We installed [CloudCompare](http://www.danielgm.net/cc/) Version 2.9.1 using [Snap](https://snapcraft.io/docs/core/install)

## OSGEO

The custom Jetstream image uses GDAL 2.1 and GRASS 7.2 built from [source](https://grasswiki.osgeo.org/wiki/Compile_and_Install).

*QGIS was run using the Docker container from [Kartoza](https://github.com/kartoza/docker-qgis-desktop)*

## Open Drone Map

We cloned the [Web Open Drone Map](https://github.com/OpenDroneMap/WebODM) from its Github repository. 

## Agisoft

[Photoscan Pro](http://www.agisoft.com/) (Version 1.3) can be downloaded directly from the Agisoft. A licence must be purchased to use on every node.


