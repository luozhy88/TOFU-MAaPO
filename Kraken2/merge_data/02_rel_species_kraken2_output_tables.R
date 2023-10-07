
################################################################################################
################################################################################################
###########################################################################################
################################################################################################
################################################################################################
###
### Species
rel_species_abundances <-   DF0 %>%
  mutate_if(grepl(".kraken2", colnames(.)), as.numeric) %>%
  rename_with(~ gsub(".kraken2_report.txt", "", .), contains(".kraken2_report.txt"))



library(tidyverse)
library(phyloseq)
## please convert abs_species_abundance from step 02 to phyloseq

DF <- rel_species_abundances %>% as.data.frame()
rownames(DF) <- paste0("OTU", rownames(DF))

taxonomy_table <- DF[,1:7] %>% as.matrix()
abundance_table <- DF[,-c(1:7)]%>% as.matrix()
# sample.data <- read.csv("040_074_mmu_metacsv.csv", row.names=1)


# Create a phyloseq object
phy.rel <- phyloseq(
   # sample_data = sample_data(sample_data),
  otu_table = otu_table(abundance_table, taxa_are_rows = TRUE),
  tax_table = tax_table(taxonomy_table)
)
SampleID=sample.names(phy.rel)
# SampleID=gsub("_.*","",SampleID)
# SampleID %in% rownames(sample.data)
# sample_names(phy.rel)=SampleID
# sample_data(phy.rel)=sample.data
## 
saveRDS(phy.rel, file = "TOFU_TSS_kraken2_output_sixhop_P621_nometa.rds")

#####