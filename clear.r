# 30site  /home/*/Desktop/jg6_metagenomics_TOFU/results/Metaphlan4/ 

library(tidyverse)
### convert the output of metaphlan4 output into data frame
rel_species_abundances <- dplyr::filter(metaphlan_rel_abundances, grepl("s__", clade_name)) %>%
  dplyr::filter(!grepl("t__", clade_name)) %>%
  dplyr::select(-clade_taxid) %>%
  tidyr::separate_wider_delim(clade_name, "|", names = c("Kingdom", "Phylum", "Class", "Order", "Family", "Genus", "Species"))


