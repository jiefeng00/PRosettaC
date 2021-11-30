
echo "
    USAGE: bash input/env.sh honda(mazda/benz/opel)
    workdir:
    |--CRBN_PDE6
        |--4TZ4_PDE6_TS2
            |--workdir
                |--input
"
qsub_queue=$1
# $1(n) quence or benz,mazda,opel(k) quence 
if [[ $HOSTNAME == k* ]]   
then
    Rosetta_DIR=/pubhome/soft/rosetta/3.12
elif [[ $HOSTNAME == n* ]]
then
    Rosetta_DIR=/home/soft/rosetta/3.12
fi

echo "
#$ -q $qsub_queue
#$ -pe $qsub_queue 12
            # 1. export PATCHDOCK=”/Path_to_PatchDock/”
            export PATCHDOCK="$HOME/software/PatchDock"
            # 2. export OB=”/Path_to_OpenBabel/”
            export OB="/usr/bin"
            # 3. export SCRIPTS_FOL=”/Path_to_the_git_folder/”
            export SCRIPTS_FOL="$HOME/FJ_git/PRosettaC/" 
            # 4. export ROSETTA_FOL=”/Path_to_Rosetta/”
            export ROSETTA_FOL=$Rosetta_DIR
            # 5. SGE_HOME=”/Path_to_SGE_bin_folder/”
            export SGE_HOME="/opt/sge/bin/lx-amd64/"
            # 6. export PBS_O_WORKDIR="$HOME/git/PRosettaC/output" 
            #export PBS_O_WORKDIR="$(pwd)/Patchdock_Results" -->
            export PBS_O_WORKDIR="$(pwd)/Patchdock_Results"

" > env.txt