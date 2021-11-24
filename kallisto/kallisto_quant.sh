#!/bin/bash

for file in /mnt/c/Users/hasna/Documents/MSc_project/20210920_rawseqdata/*.gz; do
name=$(basename "$file" )
kallisto quant -i AtRTD2_kallisto_index_v3 -o /mnt/c/Users/hasna/Documents/MSc_project/kallisto/kallisto/output/$name/ --single -l 200 -s 20 --genomebam --gtf all_done_tidy.gtf -t 3 -c chromosome_sizes.txt $file
done