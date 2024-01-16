options(download.file.method = "wget")

install.packages("argparser", Ncpus=parallel::detectCores())

if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager", Ncpus=parallel::detectCores())

Sys.setenv(MAKEFLAGS = paste("-j", parallel::detectCores()))
BiocManager::install("QDNAseq")
