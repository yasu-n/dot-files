# ~/.bashrc
#
# see /etc/bashrc for a complete description how all bash source files
# are related and used on this box

# Source system-wide aliases and functions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Original command
if [ -f ~/.commandrc ]; then
    . ~/.commandrc
fi

# aliases {{{
alias ls='/bin/ls -G'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias u='cd ../'
alias uu='cd ../../'
alias vimn='vim -u NONE -N'
alias hexadump='/bin/od -Ax -tx1z -v'
alias depdump='/usr/bin/objdump -p'
alias realpath='readlink -f'
alias extip='/usr/bin/curl ifconfig.me'
alias vimprofile='vim --cmd "profile start vimprofile" --cmd "profile file */plugin/*.vim" --cmd "profile file .vimrc" -c quit'
alias updatemod='cpan-outdated | cpanm'
alias p="perl"
alias p6="perl6"
alias pd="perldoc"
alias v="vim"
# }}}


# environment {{{
#export LANG='en_US.UTF-8'
export LANG='en_US.UTF-8'
export PS1='\u@\h:\w\$ '
export PS2='> '
export HISTCONTROL='ignoreboth'
export HISTFILESIZE='1500'
export HISTSIZE='1500'
export EDITOR='vim'
export LSCOLORS='gxfxcxdxbxegedabagacad'
export LESS='-X -i -P ?f%f:(stdin). ?lb%lb?L/%L.. [?eEOF:?pb%pb\%..]'
export LESSCHARSET=utf-8
export HOMEBRERW_NO_ANALYTICS=1
export XDG_CONFIG_HOME=$HOME/.config
source ~/.token
# }}}


# settings {{{
set -o vi
# }}}


# vimpager {{{
export VPAGER=$HOME/bin/vimpager
alias vless=$VPAGER
# }}}

# perl {{{
source $HOME/.aliases
#eval $(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)
# }}}

# Ctrl flow {{{
stty start undef
stty stop undef
# }}}
