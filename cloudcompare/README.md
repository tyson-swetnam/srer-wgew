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
