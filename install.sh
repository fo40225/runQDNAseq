while true; do
    Rscript requirements.R
    Rscript -e 'library(QDNAseq)'

    if [ $? -eq 0 ]; then
        break
    fi
done
