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
export LESS='-iRMXS'
export LESSCHARSET=utf-8
export XDG_CONFIG_HOME="$HOME/.config"

export PATH="$PATH:$HOME/bin"
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$HOME/.vimenv/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"

eval "$(pyenv init --path)"
eval "$(vimenv init -)"

# gh command (github command)
if type gh > /dev/null 2>&1; then
  eval "$(gh completion -s bash)"
fi

# rust
. "$HOME/.cargo/env"
export PATH="$(rustc --print sysroot)/lib/rustlib/x86_64-unknown-linux-gnu/bin:$PATH"
# bash completions
# rustup completions bash >> ~/.local/share/bash-completion/completions/rustup
# rustup completions bash cargo >> ~/.local/share/bash-completion/completions/cargo

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if typeset -A &>/dev/null; then
  typeset -A _paths
  typeset _results
  while read -r _p; do
    if [[ -n ${_p} ]] && (( ${_paths["${_p}"]:-1} )); then
      _paths["${_p}"]=0
      _results=${_results}:${_p}
    fi
    done <<<"${PATH//:/$'\n'}"
    PATH=${_results/:/}
    unset -v _p _paths _results
else
  typeset _p=$(awk 'BEGIN{RS=":";ORS=":"} !x[$0]++' <<<"${PATH}:")
  PATH=${_p%:*:}
  unset -v _p
fi
