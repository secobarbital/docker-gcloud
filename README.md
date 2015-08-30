# gcloud in a container
Docker container with Google Cloud SDK command line interface, using user credentials.

# Usage
## Out of the box
```
docker run -it -v ~/.config/gcloud:/root/.config/gcloud secobarbital/gcloud auth list
```
## Aliased
```
alias gcloud='docker run -it -v ~/.config/gcloud:/root/.config/gcloud secobarbital/gcloud'
gcloud auth list
```
