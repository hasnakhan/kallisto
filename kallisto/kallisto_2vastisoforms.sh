#!/bin/bash

for file in /mnt/c/Users/hasna/Documents/MSc_project/rawseqdata/*.gz; do
name=$(basename "$file" )
kallisto quant -i kallisto_2vastisoforms_index -o /mnt/c/Users/hasna/Documents/MSc_project/kallisto/kallisto/2vastisoforms/$name/ --single -l 225 -s 20 --genomebam --gtf added_2isoforms.gtf -t 3 -c chromosome_sizes.txt $file
done