# Running PDAL in a Docker Container

```
sudo docker pull pdal/pdal:1.5
```

# Running a batch with `pipeline`

I had a problem passing wildcards into the JSONs used by PDAL pipeline for file names within a directory

```
#!/bin/bash

# Loops through a directory
# Here I'm reserving a single core 23/24 on a Jetstream XL instance

ls *.laz | cut -d. -f1 | xargs -P23 -I{} \

sudo docker run -it -v ${PWD}:/data -v ${HOME}:/home pdal/pdal:1.5 pdal pipeline /home/lidar/jsons/pmf.json
```

pipeline pmf.json

```
{
  "pipeline":[
    "/data/{}.laz",
    {
      "type":"filters.pmf"
    },
    {
      "type":"writers.las",
      "filename":"/home/lidar/pmf/{}-pmf-ground.laz"
    }
  ]
}
```

# Identifying ground using the progressive morphological filters

[Progressive Morphological Filter tutorial](https://www.pdal.io/tutorial/pcl_ground.html)

[filters.pmf](https://www.pdal.io/stages/filters.pmf.html)

```
sudo docker run -it -v ${PWD}:/data pdal/pdal:1.5 pdal ground -i $f -o $base_pmf.las -v 4
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
