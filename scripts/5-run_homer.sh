INPATH="/mnt/d/projects/BME1063_HW3/results/1-peak_region_bed_combined"
OPATH="/mnt/d/projects/BME1063_HW3/results/5-homer_result"
REF="/mnt/d/projects/bme1063_hw3/data/max_circle.fasta"

mkdir -p ${OPATH}

for FILE in $(ls ${INPATH} | sed 's/\.[^.]*$//')
do
mkdir -p ${OPATH}/${FILE}
(findMotifsGenome.pl ${INPATH}/${FILE}.bed ${REF} ${OPATH}/${FILE} -norevopp -size given -len 6,8,10)\
    2> ${OPATH}/${FILE}/log.txt
done

INPATH="/mnt/d/projects/BME1063_HW3/results/1-peak_region_bed"
for FILE in $(ls ${INPATH} | sed 's/\.[^.]*$//')
do
mkdir -p ${OPATH}/${FILE}
(findMotifsGenome.pl ${INPATH}/${FILE}.bed ${REF} ${OPATH}/${FILE} -norevopp -size given -len 6,8,10)\
    2> ${OPATH}/${FILE}/log.txt
done