# TOFU-MAaPO

https://github.com/ikmb/TOFU-MAaPO  
mmu_genome:https://benlangmead.github.io/aws-indexes/bowtie  
## /home/changrong/Desktop/jg6_metagenomics_TOFU 30site  
./nextflow-23.04.1-all run ~/TOFU-MAaPO-1.3.2/ --reads sample.csv -profile custom --humann -resume  --genome human --kraken --metaphlan
## 31 site
/data3/zhiyu/software/TOFU/test  
/home/zhiyu/data/script/TOFU_16S/nextflow-23.04.1-all run /data3/zhiyu/software/TOFU/TOFU-MAaPO-1.40/ --reads fq_test.csv  -profile custom  --magscot --assembly -resume  --outdir result


./nextflow-23.04.1-all run ikmb/TOFU-MAaPO -r 1.4.0 --reads '/data3/zhiyu/rawdata/16S/221028_C70164_0089_000000000-K7RN4/*_R{1,2}_001.fastq.gz'  -profile /data3/zhiyu/software/TOFU/TOFU-MAaPO-1.40/conf/custom.config  --humann -resume  --genome human --kraken --metaphlan

// 小鼠
nextflow run ikmb/TOFU-MAaPO -r 1.4.0 --reads 'ceshi/rawdata/*_R{1,2}_001.fastq.gz'  -profile custom  --humann -resume  --genome human --kraken --metaphlan --kraken2_db '/data3/zhiyu/Database/TOFU/MGBC-26640_KrakenBracken'
// 人的
nextflow run ikmb/TOFU-MAaPO -r 1.4.0 --reads 'ceshi/rawdata/*_R{1,2}_001.fastq.gz'  -profile custom  --humann -resume  --genome human --kraken --metaphlan --kraken2_db '/data3/zhiyu/Database/TOFU/UHGG_v2.0.2'

// 默认的
nextflow  run ikmb/TOFU-MAaPO -r 1.4.0  --reads '/data3/zhiyu/pipelines/shotgun/test/ceshi/rawdata/*_R{1,2}_001.fastq.gz'  -profile custom  --humann  --genome human --kraken --metaphlan #need copy custom.config

/home/zhiyu/data/script/TOFU_16S/nextflow-23.04.1-all run ikmb/TOFU-MAaPO -r 1.4.0 --reads fq_test.csv  -profile custom  --magscot --assembly -resume  --outdir result



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
