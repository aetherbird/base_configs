# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# neovim location and default settings
echo $PATH | grep -Eq "(^|:)/opt/nvim/bin(:|)" || PATH="$PATH:/opt/nvim/bin"
export PATH
export VISUAL=/opt/nvim/bin/nvim
export EDITOR="$VISUAL"

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# red='\[\e[0;31m\]'
# RED='\[\e[1;31m\]'
# blue='\[\e[0;34m\]'
# BLUE='\[\e[1;34m\]'
# cyan='\[\e[0;36m\]'
# CYAN='\[\e[1;36m\]'
# green='\[\e[0;32m\]'
# GREEN='\[\e[1;32m\]'
# yellow='\[\e[0;33m\]'
# YELLOW='\[\e[1;33m\]'
# PURPLE='\[\e[1;35m\]'
# purple='\[\e[0;35m\]'
# nc='\[\e[0m\]'

# PS1 Prompt
# Simple Cyan
# PS1="\[\e[36m\]\u@\h:\W\\$\[\e[m\] "
# Standard Multi
PS1="\[\e[36m\]\u\[\e[m\]@\[\e[36m\]\h\[\e[m\]:\[\e[33m\]\w\[\e[m\]\[\e[33m\] > \[\e[m\]"
export PS1

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Alias definitions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Check for bash_local file for local-specific definitions
# This file is ignored by git

if [ -f ~/.bash_local ]; then
    . ~/.bash_local
fi

# Default parameter to send to the "less" command
# -R: show ANSI colors correctly; -i: case insensitive search
LESS="-R -i"

# completion features 
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Add sbin directories to PATH, useful for sudo
echo $PATH | grep -Eq "(^|:)/sbin(:|)"     || PATH=$PATH:/sbin
echo $PATH | grep -Eq "(^|:)/usr/sbin(:|)" || PATH=$PATH:/usr/sbin

