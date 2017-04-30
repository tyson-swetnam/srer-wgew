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

## M3C2
We analyzed both sfm and lidar point clouds using the [M3C2 plugin](http://www.cloudcompare.org/doc/wiki/index.php?title=M3C2_(plugin)) 
for CloudCompare. M3C2 was developed by [Lague et al. (2013)](https://geosciences.univ-rennes1.fr/IMG/pdf/Accurate_3D_point_cloud_comparison_Lague_et_al-_revised_with_figures_feb2013.pdf)
for analyzing geomorphic change along river banks using terrestrial laser scanning.

M3C2 is ideal for our point cloud comparisons because it evaluates change in horizontal, vertical, and orthogonal directions.
