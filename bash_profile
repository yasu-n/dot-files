# ~/.bash_profile
#
# see /etc/bashrc for a complete description how all bash source files
# are related and used on this box

# Source Local/Personal aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# path settings {{{
export PATH=$PATH:$HOME/bin:$HOME/vim/bin
# }}}

# libressl settings {{{
export PATH=/usr/local/opt/libressl/bin:$PATH
# }}}

# perl {{{
export PATH=$HOME/.plenv/bin:$PATH
eval "$(plenv init -)"
#export PERL5LIB=$HOME/perl5/lib/perl5:$PERL5LIB
# }}}

# python {{{
export PATH=$HOME/.pyenv/bin:$PATH
eval "$(pyenv init -)"
# }}}

# ruby rbenv {{{
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"
# }}}

# php phpenv {{{
export PATH=$HOME/.phpenv/bin:$PATH
eval "$(phpenv init -)"
# }}}

# vim vimen {{{
export PATH=$HOME/.vimenv/bin:$PATH
eval "$(vimenv init -)"
#}}}


# node.js {{{
export NODEBREW_ROOT=$HOME/.nodebrew
if [[ -s $HOME/.nodebrew ]]; then
  export PATH=$HOME/.nodebrew/current/bin:$PATH
fi
# }}}

# rakudobrew {{{
if [[ -s $HOME/.rakudobrew ]]; then
    export PATH=$HOME/.rakudobrew/bin:$HOME/.rakudobrew/moar-nom/install/share/perl6/site/bin:$PATH
    eval "$(rakudobrew init -)"
fi
# }}}


# golang {{{
export GOPATH=`go env GOPATH`
export PATH=$PATH:$GOPATH/bin
# }}}

