# Background

This repository contains the scripts and shell files used to produce the outputs from data and figures given in: 

### Frontiers in Plant Ecology: Optical approaches to remote sensing

This repository contains the core scripts and code used in [Swetnam et al. (2018)]()

## Install Prerequisites

These scripts were run on [Jetstream](https://jetstream-cloud.org/) cloud virtual machines with  [base](https://use.jetstream-cloud.org/application/images/54) and [custom](https://use.jetstream-cloud.org/application/images/330) images for Docker, GRASS and GDAL GIS, R and RStudio images.

Many of the softwares in this study are built in [Docker](https://www.docker.com/) containers. I installed [Docker CE on the base Ubuntu Dev](https://use.jetstream-cloud.org/application/images/359) Jetstream image. New instances can be launched from this image and `docker pull` the containers for analyses.

### Docker Containers List

[PDAL](https://www.pdal.io/) Version 1.5

[Entwine](https://entwine.io/) Version 1.0

[QGIS](https://github.com/kartoza/docker-qgis-desktop) Version 2.14 LTR

### Snap installs

[Snap](https://snapcraft.io/docs/core/install)

[CloudCompare](http://www.danielgm.net/cc/) Version 2.9.1

### OSGEO software

The custom Jetstream image uses GDAL 2.1 and GRASS 7.2 built from [source](https://grasswiki.osgeo.org/wiki/Compile_and_Install).

QGIS was run using a Docker container from [Kartoza](https://github.com/kartoza/docker-qgis-desktop).
