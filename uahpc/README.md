# University of Arizona HPC systems

You must have a valid UA NetID and have registered for an HPC account with [UA Services](https://account.arizona.edu/welcome)

## Logging in to UA HPC with `ssh`

Open a terminal window and `ssh` into the HPC:

```
ssh ${USER}@hpc.arizona.edu
```

To use an interactive [X11 forwarding window](https://en.wikipedia.org/wiki/X_Window_System) you need to use the `-X` or `-Y` command:

```
ssh -Y ${USER}@hpc.arizona.edu
```

You will be prompted for your University of Arizona password and then a [DUO Mobile](https://it.arizona.edu/documentation/install-duo-mobile-app-netid-plus) Dual Factor Authentication.

After you're logged into the system you will be on the Bastion with options for which machine to log into:

```
This is a bastion host used to access the rest of the environment.

Shortcut commands to access each resource
-----------------------------------------
Ocelote:                El Gato:                Cluster(ICE)/HTC/SMP:
$ ocelote               $ elgato                $ ice

```

To log into one of the machines type the name:

```
elgato
```

#### Starting a remote X11 instance

Make sure you have an X11 service installed on your localhost

Set the display on the local host

```
export DISPLAY=localhost:0.0
```

When you select one of the available HPC's from the Bastion use the `-Y` or `-X` flag to send the X11 display:

```
elgato -Y
```

## Logging in with UA HPC Ocelote On Demand

The University of Arizona recently deployed an On Demand feature on its newest HPC Ocelote which runs a browser based file manager and Jupyter Notebooks.

https://docs.hpc.arizona.edu/display/UAHPC/Special+Features

https://ood.hpc.arizona.edu

### Starting jobs on UA HPC El Gato

El Gato uses `LSF` for its job submissions

Attached are several `bsub` scripts for running jobs on El Gato

### Starting jobs on UA HPC Ocelote

Ocelote uses PBS to manage jobs. [UA HPC Manual wiki](https://confluence.arizona.edu/display/UAHPC/Training)

A basic job submission script looks like this:

```
qsub -I -N ${USER}_singularity_worker -m bea -M ${USER}@email.arizona.edu -W group_list=${USER} -q standard -l select=1:ncpus=28:mem=168gb -l cput=1344:0:0 -l walltime=48:0:0
```
Ocelote has 28 cores per node, thus the cpu time (cput) for a single node for two days is 28 * 48 hours = 1344. Here I am requesting the standard queue (-q)

### Setting up UA HPC w/o using password and DUO security

If you haven't done so, create an .ssh key, [generic instructions here](https://www.digitalocean.com/community/tutorials/ssh-essentials-working-with-ssh-servers-clients-and-keys)

```
ssh-keygen
```

After you've created the key you can use your pub key `~/.ssh/id_rsa.pub` to go ahead and ssh into the UA HPC

```
cat ~/.ssh/id_rsa.pub | ssh uid@hpc.arizona.edu "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
```

You will have to enter your password and DUO security one last time. You will see that you're not logged into the HPC after this process completes.

Now go ahead and log back in using your user id name

```
ssh -Y uid@hpc.arizona.edu
```

### [Agisoft Photoscan](www.agisoft.com)

First you need to download a copy of the latest photoscan onto your `home/user` or shared directory

```
wget http://download.agisoft.com/photoscan-pro_1_3_2_amd64.tar.gz
tar -xvzf photoscan-pro_1_3_2_amd64.tar.gz
rm photoscan-pro_1_3_2_amd64.tar.gz
```

Start Photoscan as server

```
bsub photoscan_master.sh
```

Start Photoscan worker nodes

```
photoscan_node.sh
```

## [Singularity](https://github.com/tyson-swetnam/lidar_sfm_data_fusion/blob/master/uahpc/singularity_docker.md)
