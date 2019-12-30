# ~/.bashrc
#
# see /etc/bashrc for a complete description how all bash source files
# are related and used on this box

# Source system-wide aliases and functions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
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
alias v="vim"
alias btcargo="RUST_BACKTRACE=1 cargo run"
# }}}

# settings {{{
set -o vi
source ~/.token
# }}}

# perl {{{
source $HOME/.aliases
#eval $(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)
# }}}

# Ctrl flow {{{
stty start undef
stty stop undef
# }}}
