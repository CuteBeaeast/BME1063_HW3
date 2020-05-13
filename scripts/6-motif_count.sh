# the script counts the number of motifs in the genome

MOTIF="/mnt/d/projects/BME1063_HW3/results/4-meme_result/R1_10/meme.txt"
GENOME="/mnt/d/projects/BME1063_HW3/data/max_circle.fasta"
FASTA="/mnt/d/projects/BME1063_HW3/results/2-peak_region_fasta"
# REVERSE="/mnt/d/projects/BME1063_HW3/results/6-reverse_reference"
OPATH="/mnt/d/projects/BME1063_HW3/results/6-fimo_counts"

mkdir -p ${OPATH}
# mkdir -p ${REVERSE}

# fastx_reverse_complement -i ${GENOME} -o ${REVERSE}/max_circle_reverse.fasta

# cat ${GENOME} ${REVERSE}/max_circle_reverse.fasta > ${REVERSE}/max_circle_ds.fasta

fimo --oc ${OPATH}/genome ${MOTIF} ${GENOME} # ${REVERSE}/max_circle_ds.fasta 

fimo --norc --oc ${OPATH}/R1 ${MOTIF} ${FASTA}/R1.fasta 

fimo --norc --oc ${OPATH}/R2 ${MOTIF} ${FASTA}/R2.fasta 