HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd extendedglob
bindkey -e
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

setopt AUTO_PUSHD

setopt APPEND_HISTORY # don't overwrite history; append instead
#setopt INC_APPEND_HISTORY # append after each command
setopt SHARE_HISTORY # share history between shells



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

# Aliases
alias ls='ls --color=auto'
alias df="df -h"
alias du="du -hs"
alias greps="grep -IR --color=yes -D skip --exclude-dir=.git"
alias la="ls -A --color=auto -h --group-directories-first"
alias ll="ls -lA --color=auto -h  --group-directories-first"
alias ls="ls --color=auto   --group-directories-first"

# Fix the behavior of  M-b and M-f 
export WORDCHARS=''

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


# Add build tools home paths and add then to the path
export WINEDEBUG=-all
export GRAILS_HOME=/home/ckoch/grails-1.2.1
export JAVA_HOME=/opt/icedtea-bin-6.1.11.4
export STS_HOME=/home/ckoch/springsource/sts-3.1.0.RELEASE
export STS_GG_HOME=/home/ckoch/springsource_groovy_grails/ggts-3.1.0.RELEASE
export PATH=${PATH}:${GRAILS_HOME}/bin:${STS_HOME}:${STS_GG_HOME}
