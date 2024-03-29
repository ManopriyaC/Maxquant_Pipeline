FROM docker.polly.elucidata.io/elucidata/mc_proteomics_pipeline_maxquant:v0.0.2
USER root
WORKDIR /import/
#COPY ./invoke.sh .

RUN apt-get update -y \
    && npm uninstall -g @elucidatainc/pollycli \
    && rm -rf $(npm root -g)/@elucidatainc/pollycli \
    && npm install -g @elucidatainc/pollycli@0.4.2 && polly version --version

    
ENTRYPOINT [""]

CMD ["bash", "/import/invoke.sh"]




