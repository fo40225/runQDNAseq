# runQDNAseq

TL;DR
```bash
sudo docker build -t runqdnaseq:0.0.1 .

sudo docker run -i -t --rm -v ${PWD}:${PWD} -w ${PWD} \
 runqdnaseq:0.0.1 Rscript /app/run_qdnaseq.r \
 --bam ${PWD}/SAMPLE.bam --out_prefix SAMPLE --binsize 500 --reference hg38

mv SAMPLE_calls.vcf raw_calls.vcf
mv SAMPLE_segs.vcf raw_segs.vcf
python fix_1491_vcf.py -i raw_calls.vcf -o SAMPLE_calls.vcf --sample_id SAMPLE
python fix_1491_vcf.py -i raw_segs.vcf -o SAMPLE_segs.vcf --sample_id SAMPLE

    gatk VariantsToTable \
    -V SAMPLE_calls.vcf \
    -F CHROM -F POS -F END -GF BINS -GF LOG2CNT \
    -O SAMPLE_calls.table

    awk -v sampleName=SAMPLE 'BEGIN {FS=OFS="\t"} {print sampleName, $0}' SAMPLE_calls.table > SAMPLE_calls.seg

    gatk VariantsToTable \
    -V SAMPLE_segs.vcf \
    -F CHROM -F POS -F END -GF BINS -GF LOG2CNT \
    -O SAMPLE_segs.table

    awk -v sampleName=SAMPLE 'BEGIN {FS=OFS="\t"} {print sampleName, $0}' SAMPLE_segs.table > SAMPLE_segs.seg
```
