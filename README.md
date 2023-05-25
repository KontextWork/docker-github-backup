## WAT

Backups the given github organization using https://github.com/josegonzalez/python-github-backup

## Example

```bash
export TOKEN=<pat></pat>
mkdir -p /mnt/backups/github
chown 5000:5000 /mnt/backups/github
# --private for private repos
# --fork for forked repos
# --organization as for "is organzation"
# -i incremental
# -R drupalwiki_e2e_tests # for this one repo only
docker run --rm -v /mnt/backups/github:/home/ghbackup/backups backup KontextWork -t $TOKEN --pulls --pull-comments --pull-details--fork --private --incremental --organization -o /home/ghbackup/backups -R drupalwiki_e2e_tests

# the entire organization
# -R drupalwiki_e2e_tests # for this one repo only
docker run --rm -v /mnt/backups/github:/home/ghbackup/backups backup KontextWork -t $TOKEN --pulls --pull-comments --pull-details--fork --private --incremental --organization -o /home/ghbackup/backups
```

## Alternatives

- https://rewind.com/pricing/