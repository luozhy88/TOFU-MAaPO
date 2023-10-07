library(tidyverse)

metaphlan_rel_abundances_1st <- read.delim("../kraken2_mpa_abundances.txt")
# metaphlan_rel_abundances_2nd <- read.delim("kraken2_mpa_abundances31.txt")
# metaphlan_rel_abundances_3rd <- read.delim("kraken2_mpa_abundances34.txt")

## merge and join all output tables from metaphlan module in TOFU
# metaphlan_1st_2nd <- dplyr::full_join(metaphlan_rel_abundances_1st, metaphlan_rel_abundances_2nd, by = "X.Classification")
# metaphlan_all <- dplyr::full_join(metaphlan_1st_2nd, metaphlan_rel_abundances_3rd, by = "X.Classification")
metaphlan_all =  metaphlan_rel_abundances_1st

## fill "NA" with 0.00000, then convert all numeric into 6 digits
columns_to_replace <- colnames(metaphlan_all)
##
metaphlan_all_fill <- metaphlan_all %>%
  mutate_at(vars(all_of(columns_to_replace)), ~ ifelse(is.na(.), 0.00000, .)) %>%
  mutate_if(is.numeric, ~ format(., digits = 6))

## check
# visdat::vis_miss(metaphlan_all)
# visdat::vis_miss(metaphlan_all_fill)

colnames(metaphlan_all_fill)[1] <- "clade_name"

## all with species
DF <- metaphlan_all_fill %>%
  dplyr::filter(grepl("k__Bacteria", clade_name)) %>%
  dplyr::filter(grepl("s__", clade_name)) %>%
  tidyr::separate_wider_delim(clade_name, "|", names = c("Kingdom", "Phylum", "Class", "Order", "Family", "Genus", "Species"), too_few = "align_start")
## matched
DF1 <- DF %>%
  dplyr::filter(Species != "")
## no matched
DF2 <- dplyr::setdiff(DF, DF1)

write.csv(DF2[,1:7], file = "DF2.csv",row.names = F)

######## now you just need to run the python script "python reorganization_script.py"
## DF3 generated and reloaded
system(" /home/zhiyu/data/software/anaconda3/bin/python reorganization_script.py")
##
DF3 <- read.csv("DF3.csv")

##

DF4 <- cbind(DF3, DF2[,-(1:7)])

## combine
DF0 <- rbind(DF1, DF4)

