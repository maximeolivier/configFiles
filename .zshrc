#!/usr/bin/env zsh
 
# Complétion
autoload -U compinit
compinit

#Insensible à la casse
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
 
#compinstall
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                             /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
# Crée un cache des complétion possibles
# très utile pour les complétion qui demandent beaucoup de temps
# comme la recherche d'un paquet aptitude install moz<tab>
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh_cache
# des couleurs pour la complétion
# faites un kill -9 <tab><tab> pour voir :)
zmodload zsh/complist
setopt extendedglob
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"
 
# Correction des commandes
setopt correctall
 
autoload colors; colors

white="%{[0;37m%}"
grey="%{[01;30m%}"

export PS1="${white}%B($grey%D{%H:%M:%S}$white%B) %B[%{$fg[red]%}%n%{$reset_color%}%b@%B%{$fg[cyan]%}%m%b%{$reset_color%}:%~%B]%b$% "

# Les alias marchent comme sous bash
alias ls='ls --color=auto'
alias l='ls --color=auto'
alias la='ls -a --color=auto'
alias ll='ls --color=auto -lh'
alias lla='ls -la --color=auto'
alias lll='ls --color=auto -lh | less'
# marre de se faire corriger par zsh ;)
alias xs='cd'
alias sl='ls'
# Alias df -h
alias df='df -h'
# Un grep avec des couleurs :
export GREP_COLOR=31
alias grep='grep --color=auto'
alias s='cd ..'
alias rmdir='rm -rf'
alias emacs='emacs -nw'
 
# Un VRAI éditeur de texte ;)
export EDITOR="/usr/bin/emacs -nw"
 
# Activer l'historique des commandes:
HISTFILE=~/.history
HISTSIZE=1000
SAVEHIST=1000
export HISTFILE SAVEHIST

# Définition des paramètres supplémentaires
setopt auto_pushd
setopt pushd_silent
setopt auto_cd
setopt hist_verify
