library(tidyverse)
gtf <- read_delim("C:/Users/hasna/Documents/MSc_project/kallisto/kallisto/Arabidopsis_thaliana.TAIR10.51.gtf", delim = "\t", col_names = F)
gtf <- gtf %>% filter(X3 == "gene")
gtf$X1 <- str_replace(gtf$X1, "Mt", "mitochondria")
gtf$X1 <- str_replace(gtf$X1, "Pt", "chloroplast")

#looks like the ensembl gtf has less genes than the AtRTD2 one, so filter AtRTD2 down to only the events where the geneID is in the ensembl gtf

AtRTD2 <- read_delim("C:/Users/hasna/Documents/MSc_project/kallisto/kallisto/AtRTD2_QUASI_t.gtf", delim = "\t", col_names = F)
ensembl_genes <- str_sub(gtf$X9, 10, 18)
AtRTD2$AGI <- str_split(AtRTD2$X9, ";", simplify = T)[,2]
AtRTD2$AGI <- str_sub(AtRTD2$AGI, 11, 19)
AtRTD2 <- AtRTD2 %>% filter(AGI %in% ensembl_genes)
AtRTD2$AGI <- NULL
write.table(gtf, "C:/Users/hasna/Documents/MSc_project/kallisto/kallisto/Arabidopsis_thaliana.TAIR10.51_tidy.gtf", col.names = F, row.names = F, quote = F, sep = "\t")
write.table(AtRTD2, "C:/Users/hasna/Documents/MSc_project/kallisto/kallisto/AtRTD2_QUASI_tidy.gtf", col.names = F, row.names = F, quote = F, sep = "\t")
