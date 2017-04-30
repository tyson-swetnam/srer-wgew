# Analyses in CloudCompare

On my workstations and VMs running Ubuntu I installed [CloudCompare](http://www.cloudcompare.org/) using `snapd`

I also installed CloudCompare on Windows and Mac OS X laptops using alternate installations.

For easier point cloud viewing and editing a high end video card is strongly encouraged).

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


## [Point Cloud Alignment](http://www.cloudcompare.org/doc/wiki/index.php?title=Point_picking)

The different point cloud datasets use various datums and projections. When these data are loaded for the first time together in CloudCompare the differences in their horizontal and vertical positions are often painfully obvious. 

In order to align datasets that are offset we used the CloudCompare [3-point picking](http://www.cloudcompare.org/doc/wiki/index.php?title=Point_picking)

We do not modify the scale of our point clouds - only their X,Y,Z orientation.

For all of our analyses we used the terrestrial lidar point cloud or ground control points as the 'reference' locations.

## [ Multiscale Model to Model Cloud Comparison (M3C2)](https://geosciences.univ-rennes1.fr/IMG/pdf/Accurate_3D_point_cloud_comparison_Lague_et_al-_revised_with_figures_feb2013.pdf)

We analyzed both sfm and lidar point clouds using the [M3C2 plugin](http://www.cloudcompare.org/doc/wiki/index.php?title=M3C2_(plugin)) 
for CloudCompare. M3C2 was developed by [Lague et al. (2013)](https://geosciences.univ-rennes1.fr/IMG/pdf/Accurate_3D_point_cloud_comparison_Lague_et_al-_revised_with_figures_feb2013.pdf)
for analyzing geomorphic change along river banks using terrestrial laser scanning.

M3C2 is ideal for our point cloud comparisons because it evaluates change in the horizontal, vertical, and orthogonal directions.

The cloud comparison tools use 'core' points which decimate point clouds to scales which are suitable for analyses. This is important with dense data like the TLS and sUAS sfm.
