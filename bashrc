# ~/.bashrc
alias ls='/bin/ls --color=always'
alias u='cd ../'
alias uu='cd ../../'
alias vimprofile='vim --cmd "profile start vimprofile" --cmd "profile file */plugin/*.vim" --cmd "profile file .vimrc" -c quit'
alias v="vim"

set -o vi

stty start undef
stty stop undef
