# ~/.bashrc
alias ls='/bin/ls -G'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias u='cd ../'
alias uu='cd ../../'
alias hexadump='/bin/od -Ax -tx1z -v'
alias depdump='/usr/bin/objdump -p'
alias realpath='readlink -f'
alias extip='/usr/bin/curl ifconfig.me'
alias vimprofile='vim --cmd "profile start vimprofile" --cmd "profile file */plugin/*.vim" --cmd "profile file .vimrc" -c quit'
alias v="vim"

set -o vi
source ~/.token

stty start undef
stty stop undef
