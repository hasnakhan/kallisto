#!/bin/bash

for file in /mnt/c/Users/hasna/Documents/MSc_project/20210920_rawseqdata/*.gz; do
name=$(basename "$file" )
kallisto quant -i AtRTD2_kallisto_index -o /mnt/c/Users/hasna/Documents/MSc_project/kallisto/kallisto/output/$name/ --single -l 200 -s 20 --genomebam --gtf AtRTD2_QUASI.gtf -t 3 -c chromosome_sizes.txt $file
done