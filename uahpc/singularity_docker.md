# Starting jobs on UA HPC Ocelote

Ocelote uses PBS to manage jobs. [UA HPC Manual wiki](https://confluence.arizona.edu/display/UAHPC/Training)

### Setting up UA HPC w/o using password and DUO security

If you haven't done so, create an .ssh key, [generic instructions here](https://www.digitalocean.com/community/tutorials/ssh-essentials-working-with-ssh-servers-clients-and-keys)

```
ssh-keygen
```

After you've created the key you can use your pub key `~/.ssh/id_rsa.pub` to go ahead and ssh into the UA HPC

```
cat ~/.ssh/id_rsa.pub | ssh userid@hpc.arizona.edu "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
```

You will have to enter your password and DUO security one last time. You will see that you're not logged into the HPC after this process completes.

Now go ahead and log back in using your user id name

```
ssh userid@hpc.arizona.edu
```

### Request 1 node on Ocelote

To start a job on Ocelote I can use a basic `qsub`, e.g.

```
$ qsub -I -N job_name -m bea -M userid@email.arizona.edu \
  -W group_list=group_name -q standard -l select=1:ncpus=28:mem=168gb \
  -l cput=28:0:0 -l walltime=1:0:0
```

Alternately, I can use a shell file (see [ocelote_pbs.sh](https://github.com/tyson-swetnam/eemt-singularity-dev/blob/master/ua_hpc/ocelote_pbs.sh) in this repo)

To start the shell file

```
$ . ocelote_pbs.sh
```

[Manage Running Jobs](https://confluence.arizona.edu/display/UAHPC/Running+Jobs)

# Starting a Singularity Container on UA HPC Ocelote

After submitting your job you will see something like this:

### Submitting a node request to the UA HPC
```
[tswetnam@login3 ~]$ qsub -I -N tswetnam_singularity -m bea -M tswetnam@email.arizona.edu -W group_list=tswetnam -q standard -l select=1:ncpus=28:mem=168gb -l cput=28:0:0 -l walltime=1:0:0
qsub: waiting for job 640578.head1.cm.cluster to start
qsub: job 640578.head1.cm.cluster ready

[tswetnam@i1n16 ~]$
```

### Starting a Docker container within Singularity

Run PDAL:

```
singularity shell docker://pdal/pdal:latest
```

Within the PDAL container:

```
pdal info ...
```

Run Entwine:

```
singularity shell -B /xdisk/tswetnam:/mnt docker://connormanning/entwine:latest
```

Within Entwine container:

```
entwine build /
-i <filename/folder>
-o <output directory>
```
