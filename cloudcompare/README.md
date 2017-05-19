# CloudCompare

In this folder I describe the process of aligning two different point clouds using CloudCompare and measuring their difference in the X, Y, and Z dimensions.

## Setting up CloudCompare for the first time

On my Linux (Ubuntu 16.04) workstations I installed [CloudCompare](http://www.cloudcompare.org/) using `snapd`

I also installed CloudCompare on Windows and Mac OS X laptops using those OS installation packages.

### Install [Snapd](https://snapcraft.io/docs/core/install)

```
$ sudo apt install snapd
```

### Snap install CloudCompare for Ubuntu

```
$ snap install cloudcompare
```

There is a bug in the current LTR version of CC (v2.8.1) so we moved to use the `edge` version 2.9

```
$ sudo snap refresh --edge
```

In order to access external volumes with the snap install of CloudCompare:

```
sudo snap connect  cloudcompare:removable-media  :removable-media
```

## [Point Cloud Alignment](http://www.cloudcompare.org/doc/wiki/index.php?title=Alignment_and_Registration)

For easier point cloud viewing and editing a GPU video card is strongly encouraged.

The different point cloud datasets were initially in different [datums and projections](https://github.com/tyson-swetnam/lidar_sfm_data_fusion/blob/master/cloudcompare/Point_Cloud_Alignment.md#aerial-lidar). 
When these data are loaded for the first time together in CloudCompare 
the differences in their horizontal and vertical positions are obvious. 
To align datasets that are offset we used the interactive [Rotation/Translation tool](http://www.cloudcompare.org/doc/wiki/index.php?title=Interactive_Transformation_Tool), [Fine alignment](http://www.cloudcompare.org/doc/wiki/index.php?title=ICP), and [3-point picking](http://www.cloudcompare.org/doc/wiki/index.php?title=Point_picking)

We did not modify the scale of previously generated point clouds (TLS, ALS, sUAS SfM w/ GPS).
We did modify the scale of SfM generated from the a6000 and DJI Osmos, which did not use geolocation data from the field.

For all of our analyses we use ground control points when avaialble. When GCPs were not available, 
we used the TLS point cloud as a first order reference.

## [ Multiscale Model to Model Cloud Comparison (M3C2)](https://geosciences.univ-rennes1.fr/IMG/pdf/Accurate_3D_point_cloud_comparison_Lague_et_al-_revised_with_figures_feb2013.pdf)

We analyzed both sfm and lidar point clouds using the [M3C2 plugin](http://www.cloudcompare.org/doc/wiki/index.php?title=M3C2_(plugin)) 
for CloudCompare. M3C2 was developed by [Lague et al. (2013)](https://geosciences.univ-rennes1.fr/IMG/pdf/Accurate_3D_point_cloud_comparison_Lague_et_al-_revised_with_figures_feb2013.pdf)
for analyzing geomorphic change along river banks using terrestrial laser scanning.

M3C2 is ideal for our point cloud comparisons because it evaluates change in the horizontal, vertical, and orthogonal directions.

The cloud comparison tools use 'core' points which decimate point clouds to scales which are suitable for analyses. This is important with dense data like the TLS and sUAS sfm.
