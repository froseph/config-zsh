#source `brew --prefix`/Library/Contributions/brew_zsh_completion.zsh
PATH=~/bin:/usr/local/bin:$PATH:/usr/local/sbin:/usr/local/share/npm/bin
typeset -U PATH
export PATH

fpath=(/usr/local/share/zsh-completions $fpath)

export EDITOR=vim
export VISUAL=$EDITOR
export CLICOLOR=1
export GREP_OPTIONS='--color=auto'
export LSCOLORS=Exfxcxdxbxegedabagacad

source "`brew --prefix grc`/etc/grc.bashrc"
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
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=$HISTSIZE
setopt appendhistory notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

# Prompt
autoload colors; colors
export PS1="%B%{$fg[red]%}%n%{$reset_color%}%b@%B%{$fg[cyan]%}%m%b%{$reset_color%}:%3~ %# "

# show host name tab/title bar
case $TERM in
    sun-cmd)
        precmd () { print -Pn "\e]l%~\e\\" }
        preexec () { print -Pn "\e]l%~\e\\" }
        ;;
    *xterm*|rxvt|(dt|k|E)term)
        # Need to know my host more than my user name. %n will do it though
        precmd () { print -Pn "\e]2;%m:%~\a" }
        preexec () { print -Pn "\e]2;%m:%~\a" }
        ;;
esac

# Aliases

#hash wt=~/work/whitetruffle
#alias -s py=vim
#
alias start_mysql='mysql.server start'
alias wt_env='source ~/work/whitetruffle/src/localenv/bin/activate'
alias mnm_env='source ~/work/mavenandman/src/localenv/bin/activate'

alias nginx_start='[ -f ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist ] && sudo launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist'
alias nginx_stop='[ -f ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist ] && sudo launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist'
alias wt_mysql="mysql -u webweb -p'!wH1TeTruff|3!' whitetruffle"

