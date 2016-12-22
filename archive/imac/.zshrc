# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git vagrant brew rake capistrano npm)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/git/bin:/usr/texbin

save_vim_bundle_repos() {
    for i in ~/.vim/bundle/*
    do
        (
            echo $(basename $i)
            if [[ -d ${i}/.git ]]; then
                cd $i
                echo -ne '\t'; git config remote.origin.url
            fi
        )
    done >~/Dropbox/dotfiles/imac/vim-bundles.txt
}

bootstrap_dotfiles() {
    ln -sf ~/Dropbox/dotfiles/imac/.vimrc ~/.vimrc
    ln -sf ~/Dropbox/dotfiles/imac/.gvimrc ~/.gvimrc
    ln -sf ~/Dropbox/dotfiles/imac/.vim/autoload ~/.vim/autoload
    ln -sf ~/Dropbox/dotfiles/imac/.vim/ftplugin ~/.vim/ftplugin
    ln -sf ~/Dropbox/dotfiles/imac/.vim/snippets ~/.vim/snippets
    ln -sf ~/Dropbox/dotfiles/imac/.vim/after ~/.vim/after
    ln -sf ~/Dropbox/dotfiles/imac/.zshrc ~/.zshrc
}
