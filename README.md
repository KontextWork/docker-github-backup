## WAT

Backups the given github organization using https://github.com/josegonzalez/python-github-backup

## Example

```bash
# your github organization name
export ORG=<yourorg>
# your github pat token
export TOKEN=<pat>
# the folder on your disk the backups have to be written to
export LOCAL_FOLDER=/mnt/backups/github
# --private for private repos
# --fork for forked repos
export ASPECTS_TO_BACKUP=--pulls --pull-comments --pull-details -fork --private
mkdir -p $LOCAL_FOLDER
sudo chown 5000:5000 $LOCAL_FOLDER

# --organization as for "is organzation"
# -i incremental

# backup a single repo called yourrepo
docker run --rm -v $LOCAL_FOLDER:/home/ghbackup/backups ghcr.io/kontextwork/docker-github-backup $ORG --organization -t $TOKEN $ASPECTS_TO_BACKUP --incremental -o /home/ghbackup/backups -R yourrepo

# backup the entire organization
docker run --rm -v $LOCAL_FOLDER:/home/ghbackup/backups ghcr.io/kontextwork/docker-github-backup $ORG --organization -t $TOKEN $ASPECTS_TO_BACKUP --incremental -o /home/ghbackup/backups
```

## Cloud Alternatives

- https://gitprotect.io/
- https://rewind.com/pricing/


## Credits

All of those to [python-github-backup](https://github.com/josegonzalez/python-github-backup)