# Web OpenDroneMap

We installed [Web OpenDroneMap(ODM)](https://github.com/OpenDroneMap/WebODM) 
onto a [base Ubuntu image w/ Docker CE](https://use.jetstream-cloud.org/application/images/359) on Jetstream.

WebODM can utilize multiple worker nodes for processing, 
we used large (10 core, 30 GB RAM), xlarge (24 core, 60 GB RAM), 
and xxlarge (44 core, 120 GB RAM) size instances as worker nodes.

We followed the standard installation procedures for WebODM through Docker

```
git clone https://github.com/OpenDroneMap/WebODM --config core.autocrlf=input
cd WebODM
./webodm.sh start
```

Worker nodes were started on additional VMs after installing WebODM
using the [node-ODM](https://github.com/OpenDroneMap/node-OpenDroneMap)

```
docker run -p 3000:3000 opendronemap/node-opendronemap
```
