function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias ls='ls --color=auto'

if hash ssh-pageant 2>/dev/null; then
    $(ssh-pageant)
fi

[ -f ~/z/z.sh ] && source ~/z/z.sh

mkcd() {
	mkdir -p "$@" && cd "$@";
}