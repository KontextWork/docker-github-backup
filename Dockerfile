FROM debian:bullseye-slim

RUN apt update \
    && apt upgrade -y \
    && apt-get install -y bash ca-certificates tzdata git python3 python3-pip tzdata \
    && pip3 install github-backup && github-backup -v

RUN useradd ghbackup -u 5000 -s /bin/bash -m \
    && mkdir -p /home/ghbackup/backups \ 
    && chown ghbackup /home/ghbackup/ -R


WORKDIR /home/ghbackup
USER ghbackup

ENTRYPOINT ["/usr/local/bin/github-backup"]
CMD ["--help"]