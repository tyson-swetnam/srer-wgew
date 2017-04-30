### This script asks for one entire node (span) on El Gato
### To start script use `$ bsub elgato_lsf.sh` at the bash terminal

###========================================
#!/bin/bash
#BSUB -R gpu
#BSUB -n 16
#BUSb -R "span[ptile=16]"
#BSUB -x
#BSUB -XF 
#BSUB -Is bash
#BSUB -o lsf.out
#BSUB -e lsf.err
#BSUB -q "windfall"
#BSUB -J photoscan-pro
#BSUB -u <User ID here>
###----------------------------------------

###end of script
