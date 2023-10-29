# TOFU-MAaPO

https://github.com/ikmb/TOFU-MAaPO  
mmu_genome:https://benlangmead.github.io/aws-indexes/bowtie  
## /home/changrong/Desktop/jg6_metagenomics_TOFU 30site  
./nextflow-23.04.1-all run ~/TOFU-MAaPO-1.3.2/ --reads sample.csv -profile custom --humann -resume  --genome human --kraken --metaphlan
## 31 site
/data3/zhiyu/software/TOFU/test  

# Note


fq必须是以gz结尾  
gzip *fq

https://github.com/biobakery/biobakery/wiki/humann3#23-humann-default-outputs  
https://github.com/biobakery/humann/blob/master/humann/tools/regroup_table.py#L44    


runOptions = "-B /data3/zhiyu"  #目录层级不能太多  
3.213.10.33 quay.io  
172.64.150.58 cdn03.quay.io  
/etc/init.d/networking restart  



# 自动删掉work directory
可以直接在nextflow.config文件里加上cleanup=true  
https://www.nextflow.io/docs/latest/config.html#miscellaneous  
跑完就自动删掉了work directory  
