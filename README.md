# tiesmaster's dotfiles

## init

```sh
chezmoi init --apply tiesmaster
```


## Local docker development

Build image:

```sh
cp ../../../.config/chezmoi/age.key .
docker build -t chezmoi-tiesmaster .
rm age.key
```

Start image:

```sh
docker run --rm -it chezmoi-tiesmaster
```
