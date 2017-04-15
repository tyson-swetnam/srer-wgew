# Processing tens to thousands of `.las` and `.laz` tiles with PDAL and Docker

## Setup

First launch a VM with Docker

Next, import data from a CyVerse DataStore

```
iinit
```

```
iget 
```


### Clearing out old Docker Containers

```
sudo apt-get update
```

```
# Remove all running containers
sudo docker rm --force $(sudo docker ps -aq)
# Clear out all of the cached containers
sudo docker rmi $(sudo docker images -q)
```

### Filter Outliers from `.las` or `.laz` tiles prior to analyzing.

```
for f in *.laz
    do echo "Processing $f"
    base=${f%.*}
    sudo docker run -it -v $(PWD):/data \
    -v /vol_b/lidar/filtered:/out pdal/pdal:1.5 pdal \
    translate \
    -i /data/$f \
    -o /out/$base-filtered.las
```

### Create new Ground Classification.

```
for f in *.laz
    do echo "Processing $f"
    base=${f%.*}
    sudo docker run -it -v ${PWD}:/data pdal/pdal:1.5 pdal \
    ground \
    -i $f \
    -o $base_pmf.laz \
    -v 4 \
    -p pmf_pipeline.json
```

You can add `-p` and a JSON pipeline to modify the [parameter options](https://www.pdal.io/stages/filters.pmf.html#options)

```
- p pmf_pipeline.json
```

JSON scripts
```
{
  "pipeline": {
    "name": "Progressive Morphological Filter with Outlier Removal",
    "version": 1.0,
    "filters": [{
        "name": "StatisticalOutlierRemoval",
        "setMeanK": 8,
        "setStddevMulThresh": 3.0
      }, {
        "name": "ProgressiveMorphologicalFilter"
    }]
  }
}

```

Creating DEM and DSM models using a `for` loop in BASH

```
#!/bin/bash

for f in *.laz
    do echo "Processing $f"
    base=${f%.*}
    # creates DEMs
    sudo docker run -i -v ${PWD}:/data \
        -t pdal/pdal pdal translate \
        /data/las/$f \
        /data/rasters/dem/$base-dem.tif \
        --writers.gdal.filename="/data/rasters/dem/$base-dem.tif" \
        --writers.gdal.resolution="1" \
        --writers.gdal.radius="1" \
        --writers.gdal.output_type="min"
    # creates DSMs    
    sudo docker run -i -v /lidar:/data \
        -t pdal/pdal pdal translate \
        /data/burned/$f \
        /data/rasters/dsm/$base-dsm.tif \
        --writers.gdal.filename="/data/rasters/dsm/$base-dsm.tif" \
        --writers.gdal.resolution="1" \
        --writers.gdal.radius="1" \
        --writers.gdal.output_type="max"
done
```
