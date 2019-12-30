# ~/.bash_profile
#
# see /etc/bashrc for a complete description how all bash source files
# are related and used on this box

# Source Local/Personal aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# environment {{{
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
# }}}

# local path settings {{{
export PATH=$PATH:$HOME/bin:$HOME/vim/bin
# }}}

# libressl settings {{{
export PATH=/usr/local/opt/libressl/bin:$PATH
# }}}

# perl {{{
export PATH=$HOME/.plenv/bin:$PATH
eval "$(plenv init -)"
# }}}

# python {{{
export PATH=$HOME/.pyenv/bin:$PATH
eval "$(pyenv init -)"
# }}}

# ruby rbenv {{{
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"
# }}}

# vim vimen {{{
export PATH=$HOME/.vimenv/bin:$PATH
eval "$(vimenv init -)"
#}}}

# golang {{{
export GOPATH=`go env GOPATH`
export PATH=$PATH:$GOPATH/bin
# }}}

# rust {{{
export PATH="$HOME/.cargo/bin:$PATH"
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
# }}}

export PATH="/usr/local/sbin:$PATH"
