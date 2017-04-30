# University of Arizona HPC systems

You must have a valid UA NetID

## Auth

Open a terminal window and `ssh`

```
ssh tswetnam@hpc.arizona.edu
```
To use an interactive window you need to use the `-X` or `-Y` command

```
ssh -X tswetnam@hpc.arizona.edu
```

## [Singularity]()

### Photoscan

First you need to download a copy of the latest photoscan onto your `home/user` or shared directory

```
wget http://download.agisoft.com/photoscan-pro_1_3_1_amd64.tar.gz
tar -xvzf photoscan-pro_1_3_1_amd64.tar.gz
rm photoscan-pro_1_3_1_amd64.tar.gz
```

## Agisoft Photoscan

Start Photoscan as server

```
bsub photoscan_master.sh
```

Start Photoscan worker nodes

```
photoscan_node.sh
```
