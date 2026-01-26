FROM python:3.12-trixie

RUN apt update \
    && apt upgrade -y \
    && apt-get install -y bash ca-certificates tzdata git git-lfs tzdata curl \
    && pip3 install github-backup && github-backup -v 

# git lfs support

RUN useradd ghbackup -u 5000 -s /bin/bash -m \
    && mkdir -p /home/ghbackup/backups \ 
    && chown ghbackup /home/ghbackup/ -R


WORKDIR /home/ghbackup
USER ghbackup

RUN git lfs install


ENTRYPOINT ["/usr/local/bin/github-backup"]
CMD ["--help"]
