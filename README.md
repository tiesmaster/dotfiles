# tiesmaster's dotfiles

## init

```sh
chezmoi init --apply tiesmaster
```

## install && init

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply tiesmaster
```

## Local docker development

Install dotfiles

```sh
dc run --rm dotfiles chezmoi init --apply tiesmaster
```

Start image:

```sh
dc run --rm dotfiles
```
