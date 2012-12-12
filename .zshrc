# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ckoch/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Improve auto completions
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

# Command correction
setopt correct


# Custom auto completions for specific apps
compctl -g "*.png *.svg" viewnior
# Enable for Gentoo LibreOffice
compctl -g "*.doc *.odt" lowriter
compctl -g "*.ods" localc

# Enable for Fedora LibreOffice
compctl -g "*.doc *.odt" libreoffice writer
compctl -g "*.ods" libreoffice calc

# Traverse completions with keyboard
zstyle ':completion:*' menu select 

#use LS_COLORS
alias ls='ls --color=auto'

# For using colors by name
autoload -U colors
colors

# Set prompt 
autoload -U promptinit
promptinit
# Gentoo prompt 
PROMPT=$'%B%F{green}%n@%m%k %B%F{blue}%1~ %B%F{blue}%# %b%f%k'


# Functions
arch() 
{
    uname -m
}

dist() 
{

    if [[ -a "/etc/gentoo-release" ]]
    then
        echo "gentoo"
    elif [[ -a "/etc/debian_version" ]]
    then
        echo "debian"
    fi
}

ad()
{
    arch
    dist
}

# Set title on terminal
case $TERM in
    xterm*)
        precmd () {print -Pn "\e]0;%n@%m: %~\a"}
        ;;
esac

# Set environment variables
export EDITOR=${EDITOR:-/bin/emacs}
export PAGER=${PAGER:-/usr/bin/less}
