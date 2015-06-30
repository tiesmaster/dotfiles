function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias ls='ls --color=auto'

eval $(ssh-pageant -r -a "/tmp/.ssh-pageant-$USERNAME")
