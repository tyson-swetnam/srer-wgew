# Atmosphere and Jetstream Images

It is suggested you use `featured` Ubuntu images rather than Centos on [Atmosphere](https://atmo.cyverse.org) and [Jetstream](https://use.jetstream-cloud.org/application/images). This is because most of the software used in this project are developed for Ubuntu Linux rather than RHEL.

#### Installing Docker

Installation of Docker can use the Docker [Linux instruction](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/) or the [CyVerse EZ method](https://cyverse-ez-quickstart.readthedocs-hosted.com/en/latest/).

To install Docker in a featured Atmosphere or Jetstream image, type `ezd` from the instance WebShell or terminal.

#### Installing QGIS

QGIS can be run with Docker using the [Kartoza group QGIS containers](https://github.com/kartoza/docker-qgis-desktop)

GDAL, GRASS, and QGIS can also be installed on Ubuntu instances using the [Linux installation instructions](http://www.qgis.org/en/site/forusers/alldownloads.html#linux).

#### Installing R + RStudio

Installation of R can use the [Linux instruction](https://www.r-bloggers.com/how-to-install-r-on-linux-ubuntu-16-04-xenial-xerus/) or on featured Atmosphere and Jetstream images the [CyVerse EZ method](https://cyverse-ez-quickstart.readthedocs-hosted.com/en/latest/).

#### Installing QGIS

Installation of QGIS can be done using the `install_r_rstudio_qgis.sh` file in this directory. The script provisions multiple spatial analysis tool kits including GDAL, GRASS, QGIS, RStudio, and spatial Python with Conda.

To install the software on Linux Ubuntu Xenial, copy the file to a local directory, change the permissions on the file and execute:

```
chmod +x install_r_rstudio_qgis.sh

./install_r_rstudio_qgis.sh

```
