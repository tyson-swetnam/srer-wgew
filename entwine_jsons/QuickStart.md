# Entwine for Potree and Cesium Tiles 

Run scripts as `root` or change ownership of the docker runs

```
sudo su
```

# Create folder ~/entwine

```
mkdir ~/entwine
```

Runs docker from present working directory, assuming 
the lidar data (*.las, *.laz) are in folder /lidar/

```
docker run -it -v ${PWD}:/data connormanning/entwine build \
-i /data/lidar/ \
-o ~/entwine/lidar_output
```

# Starts greyhound on port 8080 

```
docker run -it -v ~/entwine:/entwine \
-p 8080:8080 connormanning/greyhound
```

Open a new browser window and connect using either:

Speck.ly: http://speck.ly/?s=http://<remotehost>:8080/&r=lidar_output
