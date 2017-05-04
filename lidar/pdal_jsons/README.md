# Running PDAL from within a Docker Container

First I pull the most recent version of PDAL from Docker:

```
$ sudo docker pull pdal/pdal:latest
```

To run `docker` from `bash` I use:

```
$ docker run -v ${PWD}:/data pdal/pdal:latest pdal info /data/<some file name here>.laz
```

The docker container needs to have a volume mounted from the localhost using the `-v` command immediately after the `docker run` is invoked. Additional commands such as interactive `-i` and are also useful with PDAL.

For full info see ```docker run --help```

## Running a batch job with PDAL's `pipeline`

I initially had a problem passing wildcards (`*` for all file names within a directory), into the `.json` used by PDAL `pipeline`.

To solve I used `ls *.laz` and pipe `|` to list the names of all files, cutting their directory `-d` and the extension `-f1`

I use `xargs -P` to establish the number of jobs to be run (one job per core) at one time.

```
#!/bin/bash

# Loops through a directory
# Here I'm reserving a single core 23/24 on a Jetstream XL instance

ls *.laz | cut -d. -f1 | xargs -P23 -I{} \

sudo docker run -it -v ${PWD}:/data -v ${HOME}:/home pdal/pdal:1.5 pdal pipeline /home/lidar /jsons/pmf.json
```

For a `pipeline` of the Progressive Morphological Filter (pmf) I create `pmf.json` 

The `{}` in the `.json` inputs the individual file name `cut` by the first statement.

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

#### Identifying ground using the progressive morphological filters

[Progressive Morphological Filter tutorial](https://www.pdal.io/tutorial/pcl_ground.html)

[filters.pmf](https://www.pdal.io/stages/filters.pmf.html)

```
sudo docker run -it -v ${PWD}:/data pdal/pdal:1.5 pdal ground -i $f -o $base_pmf.las -v 4
```

You can add `-p` and a JSON pipeline to modify the [parameter options](https://www.pdal.io/stages/filters.pmf.html#options)

```
-p pmf_pipeline.json
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
