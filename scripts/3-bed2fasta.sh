# bash script to convert bed to fasta 

# RAWBED="/mnt/d/projects/BME1063_HW3/results/0-raw_bed"
# RAWSTRAND="/mnt/d/projects/BME1063_HW3/results/2-raw_bed_with_strand"
# RAWCOMBINE="/mnt/d/projects/BME1063_HW3/results/2-raw_bed_combined"
BED="/mnt/d/projects/BME1063_HW3/results/1-peak_region_bed"
STRAND="/mnt/d/projects/BME1063_HW3/results/1-peak_region_bed_with_strand"
COMBINED="/mnt/d/projects/BME1063_HW3/results/1-peak_region_bed_combined"
OPATH="/mnt/d/projects/BME1063_HW3/results/2-peak_region_fasta"
REF="/mnt/d/projects/bme1063_hw3/data/max_circle.fasta"
SCRIPTS="/mnt/d/projects/BME1063_HW3/scripts"

mkdir -p ${STRAND}
mkdir -p ${COMBINED}
mkdir -p ${OPATH}
# mkdir -p ${RAWSTRAND}
# mkdir -p ${RAWCOMBINE}

# preprocessing
# add strand information

python ${SCRIPTS}/2-add_strand_info.py ${BED} ${STRAND}

# cat double strand files

cat ${STRAND}/R1_minus_summits.bed ${STRAND}/R1_plus_summits.bed > ${COMBINED}/R1.bed
cat ${STRAND}/R2_minus_summits.bed ${STRAND}/R2_plus_summits.bed > ${COMBINED}/R2.bed

# python ${SCRIPTS}/2-add_strand_info.py ${RAWBED} ${RAWSTRAND}

# cat ${RAWSTRAND}/R1_minus_summits.bed ${RAWSTRAND}/R1_plus_summits.bed > ${RAWCOMBINE}/R1.bed
# cat ${RAWSTRAND}/R2_minus_summits.bed ${RAWSTRAND}/R2_plus_summits.bed > ${RAWCOMBINE}/R2.bed

# conversion using bedtools

for FILE in $(ls ${COMBINED} | sed 's/\.[^.]*$//')
do
bedtools getfasta -s -fi ${REF} -fo "${OPATH}/${FILE}.fasta" -bed ${COMBINED}/${FILE}.bed
done


rm -rf ${STRAND}