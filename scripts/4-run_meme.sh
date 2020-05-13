INPATH="/mnt/d/projects/BME1063_HW3/results/2-peak_region_fasta"
CHIPOPATH="/mnt/d/projects/BME1063_HW3/results/3-meme-chip_result"
MEMEOPATH="/mnt/d/projects/BME1063_HW3/results/4-meme_result"

mkdir -p ${CHIPOPATH}
mkdir -p ${MEMEOPATH}

# run meme-chip

# for FILE in $(ls ${INPATH} | sed 's/\.[^.]*$//')
# do
# mkdir -p ${CHIPOPATH}/${FILE}
# (meme-chip -meme-nmotifs 10 -rna -meme-minw 6 -meme-maxw 10 -oc ${CHIPOPATH}/${FILE}_rna ${INPATH}/${FILE}.fasta) \
#     1> ${CHIPOPATH}/${FILE}/log.txt 

# for WIDTH in {5..10}
# do
# mkdir -p ${MEMEOPATH}/${FILE}_${WIDTH}
# (meme -nmotifs 10 -rna -w ${WIDTH} -oc ${MEMEOPATH}/${FILE}_rna_${WIDTH} ${INPATH}/${FILE}.fasta) \
#     2> ${MEMEOPATH}/${FILE}_${WIDTH}/log.txt 
# done

# done

for FILE in $(ls ${INPATH} | sed 's/\.[^.]*$//')
do
mkdir -p ${CHIPOPATH}/${FILE}
(meme-chip -dna -meme-nmotifs 10 -meme-minw 6 -meme-maxw 10 -oc ${CHIPOPATH}/${FILE} ${INPATH}/${FILE}.fasta) \
    1> ${CHIPOPATH}/${FILE}/log.txt 

for WIDTH in {5..10}
do
mkdir -p ${MEMEOPATH}/${FILE}_${WIDTH}
(meme -dna -nmotifs 10 -w ${WIDTH} -oc ${MEMEOPATH}/${FILE}_${WIDTH} ${INPATH}/${FILE}.fasta) \
    2> ${MEMEOPATH}/${FILE}_${WIDTH}/log.txt 
done

done