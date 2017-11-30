###========================================
#!/bin/bash
#BSUB -q "standard"
#BSUB -R gpu
#BSUB -n 16
#BUSb -R "span[ptile=16]"
#BSUB -x
#BSUB -XF
#BSUB -Is bash
#BSUB -o lsf.out
#BSUB -e lsf.err
#BSUB -J photoscan-pro
#BSUB -u uid
#---------------------------------------------------------------------

#name=`uname -n`-ib0
#echo $name
#ip=`getent hosts $name | awk '{print $1}'`
#echo $ip

cd ~/photoscan-pro

# Server
./photoscan.sh --server --control 10.0.148.3 --dispatch 10.0.148.3

# ./photoscan.sh &&
# nvidia-smi -l 1

###end of script
