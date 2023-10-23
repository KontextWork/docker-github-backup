## WAT

Backups the given github organization using [https://github.com/josegonzalez/python-github-backupit](https://github.com/josegonzalez/python-github-backup)

Features
 - wraps the python library without leaking any dependencies into the host system
 - runs as non root to ensure it runs isolated and can only write only designated folders
 - git lfs support is included

## Example

All the variables
```bash
# your github organization name
export ORG=<yourorg>
# your github pat token
export TOKEN=<pat>
# the folder on your disk the backups have to be written to
export LOCAL_FOLDER=/mnt/backups/github
# --private for private repos
# --fork for forked repos
# --repositories 
export ASPECTS_TO_BACKUP=--pulls --pull-comments --pull-details --repositories  --fork --private
```

prepare the target folder on your host
```bash
mkdir -p $LOCAL_FOLDER
# the user inside the docker container runs under 5000:5000 and needs write permissions on the local folder
sudo chown 5000:5000 $LOCAL_FOLDER
```

run a backup (run once command)
```bash
# backup a single repo called yourrepo
docker run --rm -v $LOCAL_FOLDER:/home/ghbackup/backups ghcr.io/kontextwork/github-backup $ORG --organization -t $TOKEN $ASPECTS_TO_BACKUP --incremental -o /home/ghbackup/backups -R yourrepo

# backup the entire organization
docker run --rm -v $LOCAL_FOLDER:/home/ghbackup/backups ghcr.io/kontextwork/github-backup $ORG --organization -t $TOKEN $ASPECTS_TO_BACKUP --incremental -o /home/ghbackup/backups
```

## Usage

You usually will run the one-off command to run the backup and remove the docker-container right away. You need to 
handle the cronjob outside the docker-image, it is not designed to run stateful.

## Cloud Alternatives

This list is by now means complete or curated - just things we found. If you have any good findings, add them :)

- https://gitprotect.io/
- https://rewind.com/pricing/


## Credits

All of those to [python-github-backup](https://github.com/josegonzalez/python-github-backup)
