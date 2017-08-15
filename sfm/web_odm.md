# Web OpenDroneMap

We installed [Web OpenDroneMap(ODM)](https://github.com/OpenDroneMap/WebODM) 
onto a [base Ubuntu image w/ Docker CE](https://use.jetstream-cloud.org/application/images/359) on Jetstream.

WebODM can utilize additional nodes as workers for multiple project processing. 

For processing large jobs on Jetstream we used xlarge (24 core, 60GB RAM), and xxlarge (44 core, 120GB RAM) size instances as our worker nodes. On Atmosphere we used an Xlarge3 instance (16 core, 128GB RAM). In both cases we went with Ubuntu 14.04 or 16.04.

We also use the `ezd` command to install Docker CE. Instructions available from [CyVerse Learning Center](https://cyverse-ez-quickstart.readthedocs-hosted.com/en/latest/index.html)

We followed the standard installation procedures for WebODM through Docker

```
git clone https://github.com/OpenDroneMap/WebODM --config core.autocrlf=input
cd WebODM
./webodm.sh start
```

You log into the WebODM instance by typing your IP address and port `:8000`

A celebratory screen should appear. Set up your user_name and password.

### Worker nodes for WebODM

WebODM can distribute jobs to multiple nodes. It is not advised to connect VMs from different locations, e.g. a head node running in Tucson with the worker node running in Indiana. Doing so will greatly slow transfer of data, and possibly result in failed jobs.

Worker nodes were started using the [node-ODM](https://github.com/OpenDroneMap/node-OpenDroneMap) instructions for Docker:

```
docker run -p 3000:3000 opendronemap/node-opendronemap
```

## ODM orthomosaic and point cloud creation settings.

[OpenDroneMap](https://github.com/OpenDroneMap/OpenDroneMap/wiki/Process-Breakdown) uses the open-source sfm-mvs.

[PMVS Parameter](http://www.di.ens.fr/pmvs/documentation.html) settings are exposed in the Dashboard 

Add a Project

Upload photos

Set Options

|Parameter|Setting|Use|
|---------|-------|-----|
|mesh-solver-divide|default|establish oct-tree depth|
|matcher-threshold|default|if two images share less than n% of keypoints, ignore|
|mesh-octree-depth|defalut|Oct-tree depth use in mesh reconstruction|
|min-num-features|default|more features = better results, but slower|
|force-focal|default|override focal length|
|resize-to|**max width**|use the maximum image width, equivalent to 'ultra high' resolution|
|texturing-keep-unseen-faces|default|keeps faces in mesh not seen|
|pmvs-level|**0**|original image size for computation|
|pmvs-threshold|**0.9**|success if > threshold, default = 0.7|
|texturing-outlier-removal-type|default|type of outlier removal tool|
|texturing-skip-hole-filling|default|fills holes in mesh|
|orthophoto-resolution|**50**|pixels/meter, default=20|
|force-ccd|default|overide ccd width|
|orthophooto-no-tiled|default|stripe GeoTIFF|
|mesh-size|default|number of vertexes in mesh|
|orthophoto-compression|default|set the compression|
|matcher-distance|default|distance threshold to GPS data|
|verbose|default|print messages to console|
|pmvs-csize|**3**|cell-size controls density of reconstruction, default=2|
|use-exif|**true**|uses exif geotag, default=false|
|mesh-samples|default|number of points per octree node|
|texturing-skip-local|default|skip local seem blending|
|pmvs-wsize|default|pixel sample color resolution|
|orthophoto-target-srs|default|sets EPSG|
|texturing-tone-mapping|default|turn on gamma tone|
|pmvs-min-images|**5**|min 5 images for reconstruction, default=3|
|opensfm-processes|**default**|max # cores for processing dense reconstruction|
|texturing-skip-global-seam-leveling|default|skip seams, useful for IR|
|texturing skip-visibility-test|default|skip geometric visiblity|
|matcher-ratio|default|ratio of distance to next best match|
|matcher-neighors|default|number of n-neighbors to pre match based on GPS-exif|
