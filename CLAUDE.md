# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

This is a [chezmoi](https://www.chezmoi.io/) source directory (`~/.local/share/chezmoi`) holding personal dotfiles. Nothing is built or tested; files here are rendered into `$HOME` by chezmoi.

## Commands

- `chezmoi diff <target>`: show what applying would change (e.g. `chezmoi diff ~/.config/starship.toml`)
- `chezmoi apply <target>`: render and write a single target into `$HOME`; omit the target to apply everything
- `chezmoi execute-template --override-data '{"chezmoi":{"hostname":"warmachine"}}' < file.tmpl`: render a template as another host would, to check per-host output without applying it
- `docker compose run --rm dotfiles chezmoi init --apply tiesmaster`, then `docker compose run --rm dotfiles`: try the dotfiles in a throwaway Ubuntu container (`Dockerfile`, `compose.yaml`)

The shell aliases in `dot_bashrc.d/chezmoi` (`cza`, `czd`, `cze`, `czc`, ...) wrap the same commands.

## Layout and conventions

- Source names follow chezmoi attributes: `dot_` → `.`, `private_` → mode 0600/0700, `executable_`, `symlink_`, `encrypted_*.age`, `run_onchange_before_*` scripts, and a `.tmpl` suffix for Go templates. Edit the source file here, not the rendered file in `$HOME`.
- **Per-host differences** are keyed on `.chezmoi.hostname`. `warmachine` is the work laptop: work-only files (`.bashrc.d/guida`, `.gitconfig-guida`, `.kube/configs`, ...) are excluded elsewhere via `.chezmoiignore`, and templates such as `private_dot_gitconfig.tmpl`, `private_dot_ssh/config.tmpl`, `dot_kube/private_config.tmpl` and `dot_config/starship.toml.tmpl` branch on it. To make a file differ per host, rename it to `.tmpl` (with `git mv`) and wrap the differing lines in `{{- if eq .chezmoi.hostname "warmachine" }}`. Check that the warmachine output still matches what it did before.
- **Encryption** uses age (`.chezmoi.toml.tmpl`). The age identity is itself stored passphrase-encrypted as `key.txt.age` and decrypted to `~/.config/chezmoi/key.txt` by `bin/run_onchange_before_decrypt-private-key.sh.tmpl`. `encrypted_*.age` files can't be read or grepped as plain text; use `chezmoi edit` / `chezmoi decrypt`.
- **Externals** (`.chezmoiexternal.toml`): `bin/z.sh` and the vim plugins under `.vim/pack/plugins/start/` are downloaded by chezmoi and aren't in the repo.
- **Bash**: `dot_bashrc` sources the modules in `dot_bashrc.d/` one by one by explicit name, so a new module must be added there (`guida` is sourced only if it exists). On startup the shell warns when `chezmoi status` or the source repo's git status isn't clean.
- **Function-key bindings are split across tools**: `dot_tmux.conf` binds F2–F7 (with `-n`), `dot_inputrc` binds F1–F4, F8, F9 and F12 for readline. A key bound in tmux never reaches bash, so check both files before assigning a key.
- `dot_config/starship.toml.tmpl` uses the gruvbox preset with powerline segments: every module's `style`/`format` must set the background colour of the segment it sits in (see the comment at the top of that file).
- `ref/` holds old reference configs and is ignored by chezmoi.

## Commits

chezmoi is configured with `autoCommit`/`autoPush`, and commit messages follow its style: `Update <target path>` / `Add <target path>` (e.g. `Update .config/starship.toml`), with several targets listed in one message. Only apply, commit or push when asked.

When asked to commit, also run `chezmoi update` after the commit if it has no impact beyond the committed change. Check `chezmoi diff` first, and `git fetch` to see if upstream has new commits. If either shows changes other than the ones just committed, don't update; report what's pending instead.
