# tiesmaster's dotfiles

## init

```sh
chezmoi init --apply tiesmaster
```


## Local docker development

Build image:

```sh
cp ../../../.config/chezmoi/age.key .
dc build
rm age.key
```

Install dotfiles

```sh
dc run --rm dotfiles chezmoi init --apply tiesmaster
```

Start image:

```sh
dc run --rm dotfiles
```
