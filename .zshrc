# Environment Varibles
######################
PATH=~/bin:/usr/local/bin:$PATH:/usr/local/sbin:/usr/local/share/npm/bin
typeset -U PATH
export PATH

fpath=(/usr/local/share/zsh-completions $fpath)

export EDITOR=vim
export VISUAL=$EDITOR
export CLICOLOR=1
export GREP_OPTIONS='--color=auto'
export LSCOLORS=Exfxcxdxbxegedabagacad

# Autocomplete settings
#######################
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _match _correct _approximate
zstyle ':completion:*' glob 1
zstyle ':completion:*' ignore-parents parent directory
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' match-original both
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' max-errors 1
zstyle ':completion:*' menu select=1
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' squeeze-slashes true
zstyle :compinstall filename '/Users/froseph/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# ZSH Config stuff
##################
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=$HISTSIZE
setopt appendhistory notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

# Brew j0nx
###########
source "`brew --prefix grc`/etc/grc.bashrc"

# Prompt
########
autoload colors; colors
autoload -Uz vcs_info
# disable a bunch of vcs_info support
zstyle ':vcs_info:*' enable git hg
setopt PROMPT_SUBST

export PS1="%B%{$fg[red]%}%n%{$reset_color%}%b@%B%{$fg[cyan]%}%m%b%{$reset_color%}:%3~ %# "

# XXX testing
zstyle ':vcs_info:*' actionformats '%F{5}%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
#zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
export PS1='%F{5}[%F{2}%n%F{5}] %F{3}%3~ ${vcs_info_msg_0_}%f%# '


# show host name tab/title bar
case $TERM in
    sun-cmd)
        precmd () { vcs_info; print -Pn "\e]l%~\e\\" }
        preexec () { print -Pn "\e]l%~\e\\" }
        ;;
    *xterm*|rxvt|(dt|k|E)term)
        # Need to know my host more than my user name. %n will do it though
        precmd () { vcs_info; print -Pn "\e]2;%m:%~\a" }
        preexec () { print -Pn "\e]2;%m:%~\a" }
        ;;
    *)
        # By default need vcs_info. This is used for tmx/screen etc
        precmd () { vcs_info }
        preexec () {  }
        ;;
esac

# Aliases / Shortcuts
#####################
#hash wt=~/work/whitetruffle
#alias -s py=vim
#
alias start_mysql='mysql.server start'
alias wt_env='source ~/work/whitetruffle/src/localenv/bin/activate'
alias mnm_env='source ~/work/mavenandman/src/localenv/bin/activate'

alias nginx_start='[ -f ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist ] && sudo launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist'
alias nginx_stop='[ -f ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist ] && sudo launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist'
alias wt_mysql="mysql -u webweb -p'!wH1TeTruff|3!' whitetruffle"

