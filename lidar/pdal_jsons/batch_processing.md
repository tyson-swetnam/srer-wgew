# Processing tens to thousands of `.las` and `.laz` tiles with PDAL and Docker

## Setup

First launch the VM and update.

```
sudo apt-get update
```

Next, import data from a CyVerse DataStore

```
iinit
```

```
iget 
```


### Clearing out old Docker Containers

```
# Remove all running containers
sudo docker rm --force $(sudo docker ps -aq)
```

```
# Clear out all of the cached containers
sudo docker rmi $(sudo docker images -q)
```

### Filter Outliers from `.las` or `.laz` tiles prior to analyzing.

loop.sh

```
#!/bin/bash

# Loops through a directory
# Here I'm reserving a single core 23/24 on a Jetstream XL instance

ls *.laz | cut -d. -f1 | xargs -P23 -I{} \
```

### Create new Ground Classification.

You can use a JSON pipeline to modify the [parameter options](https://www.pdal.io/stages/filters.pmf.html#options)

I am looping through the file directory, running the number of containers up to the number of cores on my VM minus one.

`ls *.laz | cut -d. -f1 | xargs -P23 -I{} \` 

a file named `loop_pmf.sh`

```
#!bin/bash

ls *.laz | cut -d. -f1 | xargs -P23 -I{} \
sudo docker run \
    -v ${HOME}:/home \
    -v ${PWD}:/data \
    pdal/pdal:1.5 pdal \
    pipeline /home/Downloads/pdal/pmf.json \
    --readers.las.filename=/data/{}.laz \
    --writers.las.filename=/home/lidar/{}-pmf-ground.laz

```

contents of file named `pmf.json`

```
{
  "pipeline":[
    "/data/{}.laz",
    {
      "type":"filters.pmf"
    },
    {
      "type":"writers.las",
      "filename":"/home/{}-pmf-ground.laz"
    }
  ]
}
```

Creating DEM and DSM models using a `for` loop in BASH

```
#!/bin/bash
mkdir ${HOME}/rasters
mkdir ${HOME}/rasters/dem
mkdir ${HOME}/rasters/dsm

ls *.laz | cut -d. -f1 | xargs -P23 -I{} \
    # creates DEMs
    sudo docker run -i \
        -v ${HOME}:/home \
        -v ${PWD}:/data \
        -t pdal/pdal pdal translate \
        /data/{}.laz \
        /home/rasters/dem/{}-dem.tif \
        --writers.gdal.filename="/home/rasters/dem/{}-dem.tif" \
        --writers.gdal.resolution="1" \
        --writers.gdal.radius="1" \
        --writers.gdal.output_type="min"
    # creates DSMs    
    sudo docker run -i \
        -v ${HOME}:/home \
        -v ${PWD}:/data \
        -t pdal/pdal pdal translate \
        /data/{} \
        /home/rasters/dsm/{}-dsm.tif \
        --writers.gdal.filename="/data/rasters/dsm/{}-dsm.tif" \
        --writers.gdal.resolution="1" \
        --writers.gdal.radius="1" \
        --writers.gdal.output_type="max"
```

