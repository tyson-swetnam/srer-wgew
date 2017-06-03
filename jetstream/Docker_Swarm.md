# Swarm

I wanted to test out processing lidar data using Docker Swarm mode on Jetstream.

[YouTube video on Docker Swarms](https://www.youtube.com/watch?v=KC4Ad1DS8xU)

To start, I fired up a half dozen single core VMs with Docker v1.12+ on Jetstream

After I `ssh` into the first VM I found the `inet addr:` internal IP address 
for the VM on the subnet that Docker Swarm will use to communicate with the other VMS

```
ifconfig
```

The correct `inet addr:` is listed in `eth0`, NOT in `docker0` or `lo`

This VM is going to be designated as the Swarm Manager because it is the first one started.

```
 sudo docker swarm init --listen-addr 172.21.50.7:2377
```

The output should look something like this:

```
tswetnam@js-157-25:~$ sudo docker swarm init --listen-addr 172.21.50.7:2377
Swarm initialized: current node (863bo4r89irjsautfl7neyya1) is now a manager.

To add a worker to this swarm, run the following command:

    docker swarm join \
    --token SWMTKN-1-0gcqhl826piyork0crxapoodasmiqx5ptetwd8upa09l0kuv0f-4voz9apc7uakcr0hiybzc6ujz \
    172.21.50.7:2377

To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.

tswetnam@js-157-25:~$
```

To check the node,

```
sudo docker node ls
```

Now, `ssh` into your second VM on the same subnet (e.g. IU or TACC) and start a second node using 

```
sudo docker swarm join \
    --token SWMTKN-1-0gcqhl826piyork0crxapoodasmiqx5ptetwd8upa09l0kuv0f-4voz9apc7uakcr0hiybzc6ujz \
    172.21.50.7:2377
```


Here's my test of setting up a Docker Swarm in Jetstream

```
#!/usr/local/bin/python

from os import environ

if __name__ == "__main__":

    action = environ.get('action')  # Will be passed in via Docker -e environment variable

    if action == 'etl':
        pass  # Run ETL
    elif action == 'analysis':
        pass # Run analysis
    else:
        print('Action not supported')
```

```
# VERY basic Dockerfile
FROM python:2.7
ADD your_script.py /home/user/your_script.py  # Add to container
CMD ["python", "-u", "/home/user/your_script.py"]  # Run
```


```
# Create Docker image
docker build --tag='pdal_swarm' .

# Create Docker service, default to 0 containers, set environment variable appropriately
docker service create --name service_etl --replicas 0 --e "action=etl"  pdal_swarm  # Run ETL example
docker service create --name service_analysis --replicas 0 --e "action=analysis"  pdal_swarm  # Run analysis example

# Scale as much as your infrastructure will handle
docker service scale service_etl=300
docker service scale service_analysis=300

# To scale down when you are done use
docker service scale service_etl=0
docker service scale service_analysis=0
```
