FROM debian:bookworm-slim

RUN apt update \
    && apt upgrade -y \
    && apt-get install -y bash ca-certificates tzdata git git-lfs python3 python3-pip tzdata curl \
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
