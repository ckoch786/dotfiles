#TODO create and source separate files for home, school(green, lab, and ET),
#     th1, aliases, custome completions

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
WORK=~/.zsh_work
FUNCTIONS=~/.zsh_functions
COWER_COMPLETIONS=~/builds/cower/src/cower-8/zsh_completion

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
compctl -g "*.hs" ghc
compctl -g "*.hs" runhaskell
# Enable for Gentoo LibreOffice
compctl -g "*.doc *.odt" lowriter
compctl -g "*.ods" localc

# Enable for Fedora LibreOffice
compctl -g "*.doc *.odt" libreoffice writer
compctl -g "*.ods" libreoffice calc

# Source other completions
if [[ -a $COWER_COMPLETIONS ]]
then
    source $COWER_COMPLETIONS
else
    echo "Cower completions DNE at $COWER_COMPLETIONS"
fi


# Traverse completions with keyboard
zstyle ':completion:*' menu select 

# Aliases
alias ls='ls --color=auto'
alias df="df -h"
alias du="du -hs"
alias greps="grep -IR --color=yes -D skip --exclude-dir=.git"
alias l='ls --color=auto'
alias la="ls -A --color=auto -h --group-directories-first"
alias ll="ls -lA --color=auto -h  --group-directories-first"
alias ls="ls --color=auto   --group-directories-first"
alias //="ls -lA --color=auto -h  --group-directories-first"

# For work
alias shelves="svn ls -v svn://10.1.10.8/sls/shelves/ckoch"
export sls="svn://10.1.10.8/sls"
export trunk="svn://10.1.10.8/sls/trunk"
export shelf="svn://10.1.10.8/sls/shelves/ckoch"


# Keyboard layout aliases

# Change keyboard layout to us
alias us="setxkbmap -layout us"

# Change keyboard layout to dvorak
alias dus="setxkbmap -layout dvorak"

# Change keyboard layout to programmers dvorak
alias dvp="setxkbmap -layout us -variant dvp"





alias pacman='PACMAN=/usr/bin/pacman; [ -f /usr/bin/pacman-color ] && PACMAN=/usr/bin/pacman-color; $PACMAN $@'


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
#PROMPT=$'%B%F{green}%n@%m%k %B%F{blue}%1~ %B%F{blue}% %B%F{red}# %b%f%k'

# Source Functions
source $FUNCTIONS


# Set title on terminal
case $TERM in
    xterm*)
        precmd () {print -Pn "\e]0;%n@%m: %~\a"}
        ;;
esac

# Set environment variables
export VISUAL="emacs -nw"
export DISPLAY=':0.0'
export EDITOR=${EDITOR:-/bin/emacsclient}
export PAGER=${PAGER:-/usr/bin/less}
export BROWSER="google-chrome"

# source work related settings
if [[ -a $WORK ]]
then
    source $WORK
else
    echo "Not at work."
fi
