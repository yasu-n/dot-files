# ~/.bash_profile
#
# see /etc/bashrc for a complete description how all bash source files
# are related and used on this box

# Source Local/Personal aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

export BASH_SILENCE_DEPRECATION_WARNING=1

export LANG='en_US.UTF-8'
export PS1='\u@\h:\w\$ '
export PS2='> '
export HISTCONTROL='ignoreboth'
export HISTFILESIZE='1500'
export HISTSIZE='1500'
export EDITOR='vim'
export LSCOLORS='gxfxcxdxbxegedabagacad'
export EXA_COLORS="da=1;36"
export LESS='-X -i -P ?f%f:(stdin). ?lb%lb?L/%L.. [?eEOF:?pb%pb\%..]'
export LESSCHARSET=utf-8
export HOMEBRERW_NO_ANALYTICS=1
export XDG_CONFIG_HOME="$HOME/.config"

export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/vim/bin"
export PATH="$HOME/.plenv/bin:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.nodebrew/current/bin:$PATH"
export PATH="$HOME/.vimenv/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:/usr/local/opt/riscv-gnu-toolchain/bin"

export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

eval "$(plenv init -)"
eval "$(pyenv init -)"
eval "$(rbenv init -)"
eval "$(vimenv init -)"

export PATH="/usr/local/opt/llvm/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"
