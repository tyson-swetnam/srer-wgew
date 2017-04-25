# Web OpenDroneMap

We installed [Web OpenDroneMap(ODM)](https://github.com/OpenDroneMap/WebODM) 
onto a [base Ubuntu image w/ Docker CE](https://use.jetstream-cloud.org/application/images/359) on Jetstream.

WebODM can utilize additional nodes as workers for multiple project processing. 
On Jetstream we used large (10 core, 30 GB RAM), xlarge (24 core, 60 GB RAM), 
and xxlarge (44 core, 120 GB RAM) size instances as our worker nodes.

We followed the standard installation procedures for WebODM through Docker

```
git clone https://github.com/OpenDroneMap/WebODM --config core.autocrlf=input
cd WebODM
./webodm.sh start
```

You log into the WebODM instance by typing your IP address and port `:8000`

The initial login is `admin`

and password `admin`

### Worker nodes for WebODM

Worker nodes were started on additional VMs after installing WebODM
using the [node-ODM](https://github.com/OpenDroneMap/node-OpenDroneMap)

```
docker run -p 3000:3000 opendronemap/node-opendronemap
```

## ODM orthomosaic and point cloud creation settings.

Unlike Agisoft Photoscan, [OpenDroneMap](https://github.com/OpenDroneMap/OpenDroneMap/wiki/Process-Breakdown) uses open-source sfm-mvs.

Pameter settings are exposed in the Dashboard 

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
|pmvs-level|default|level in image pyramid for computation|
|pmvs-threshold|default|success if > threshold|
|texturing-outlier-removal-type|default|type of outlier removal tool|
|texturing-skip-hole-filling|default|fills holes in mesh|
|orthophoto-resolution|default|pixels/meter|
|force-ccd|default|overide ccd width|
|orthophooto-no-tiled|default|stripe GeoTIFF|
|mesh-size|default|number of vertexes in mesh|
|orthophoto-compression|default|set the compression|
|matcher-distance|default|distance threshold to GPS data|
|verbose|default|print messages to console|
|pmvs-csize|default|cell-size controls density of reconstruction|
|use-exif|default|uses exif geotag|
|mesh-samples|default|number of points per octree node|
|texturing-skip-local|default|skip local seem blending|
|pmvs-wsize|default|pixel sample color resolution|
|orthophoto-target-srs|default|sets EPSG|
|texutring-tone-mapping|default|turn on gamma tone|
|pmvs-min-images|default|min # images for reconstruction|
|opensfm-processes|**default**|max # cores for processing dense reconstruction|
|texturing-skip-global-seam-leveling|default|skip seams, useful for IR|
|texturing skip-visibility-test|default|skip geometric visiblity|
|matcher-ratio|default|ratio of distance to next best match|
|matcher-neighors|default|number of n-neighbors to pre match based on GPS-exif|
