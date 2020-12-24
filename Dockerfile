FROM debian:buster

RUN groupadd --gid 1000 deno \
    && useradd --uid 1000 --gid deno --shell /bin/bash --create-home deno

RUN apt-get update && \
    apt-get full-upgrade -y && \
    apt-get install curl unzip -y && \
    apt-get clean 

USER deno

RUN curl -fsSL https://deno.land/x/install/install.sh | sh

ENV DENO_INSTALL "/home/deno/.deno"
ENV PATH "$PATH:$DENO_INSTALL/bin"

USER root

RUN deno --version 
    
CMD ['deno']