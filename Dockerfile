FROM docker.polly.elucidata.io/elucidata/sos-base:v0.0.1
USER root
WORKDIR /import/
COPY ./invoke.sh .

RUN apt install gnupg ca-certificates -y \
    && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF \
    && apt update -y \
    && apt install mono-complete -y 

RUN wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \
    && rm packages-microsoft-prod.deb

RUN apt-get update; 
RUN apt-get install -y apt-transport-https 
RUN apt-get update 
RUN apt-get install -y dotnet-sdk-3.1

RUN apt-get update;
RUN apt-get install -y xmlstarlet

ADD MaxQuant_2.1.3.0.zip .
RUN unzip "MaxQuant_2.1.3.0.zip"

ENTRYPOINT [""]

CMD ["bash", "/import/invoke.sh"]




