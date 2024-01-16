FROM r-base:4.2.2
RUN apt update; apt install -y wget libcurl4-openssl-dev libxml2-dev ca-certificates 
COPY . /app
WORKDIR /app
RUN mkdir /root/.R/
RUN echo "CFLAGS=-march=native" >>/root/.R/Makevars
RUN echo "CXXFLAGS=-march=native" >>/root/.R/Makevars
RUN mv /app/QDNAseq.hg19 /usr/local/lib/R/site-library
RUN mv /app/QDNAseq.hg38 /usr/local/lib/R/site-library
RUN sh install.sh
