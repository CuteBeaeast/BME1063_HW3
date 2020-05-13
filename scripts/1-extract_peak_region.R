# read peak files in bed format.
# write bed files with a 100bp window on every peak position
# reference: https://bioinformatics-core-shared-training.github.io/cruk-summer-school-2018/ChIP/Practicals/Practical7_Downstream_Analysis_of_ChIP-seq_SS.html#motif-enrichment-analysis

# read in data and set interval
inpath <- "/mnt/d/projects/BME1063_HW3/data"
opath <- "/mnt/d/projects/BME1063_HW3/results/1-peak_region_bed"

dir.create(opath, showWarnings=FALSE)

file.names <- dir(inpath, pattern="\\.bed")

for(i in 1:length(file.names)) {
    peakfile <- read.table(file.path(inpath, file.names[i]), sep="\t")

    # create a new frame containing window info
    Motif_Peaks <- data.frame(
        (peakfile$V1), 
        (peakfile$V2-25), 
        (peakfile$V3+25), 
        stringsAsFactors=FALSE 
        )

    # create bed file
    options(scipen=999)

    write.table(Motif_Peaks, 
    file=file.path(opath, file.names[i]), 
    row.names=FALSE, col.names=FALSE, 
    sep="\t", 
    quote=FALSE
    )
}