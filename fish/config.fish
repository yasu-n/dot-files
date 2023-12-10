# Commands to run in interactive sessions can go here
if status is-interactive
    set -gx theme_display_git_default_branch yes
    set -gx theme_color_scheme dark
    set -gx theme_nerd_fonts yes

    set -gx theme_display_date yes
    set -gx theme_date_format "+%F %H:%M"
    set -gx theme_date_timezone Asia/Tokyo
end

# environment variables
set -gx LANG en_US.utf8
set -gx LC_TIME en_US.utf8
set -gx LESS '-iRMXS'
set -gx LESSCHARSET utf-8
set -gx EDITOR nvim
set -gx LSCOLORS 'gxfxcxdxbxegedabagacad'

# PATH: environment variable
fish_add_path ~/bin
fish_add_path ~/.pyenv/bin
fish_add_path ~/.vimenv/bin
fish_add_path ~/.nvimenv/bin
fish_add_path ~/.zig
fish_add_path ~/.zig/bin
fish_add_path ~/.deno/bin
fish_add_path ~/.cargo/bin

# remove duplicated path
#set -x PATH (echo $PATH | tr ' ' '\n' | sort -u)

if status is-login
    pyenv init --path | source
    vimenv init - | source
    nvimenv init - | source
end

# remove greeting message
set fish_greeting

# lldb
set -gx PYTHONPATH /usr/lib/llvm-16/lib/python3.11/site-packages

# rust
set -gx RUST_SRC_PATH (rustc --print sysroot)/lib/rustlib/src/rust/src
set -gx EXA_COLORS "da=1;36"

# vi mode
fish_vi_key_bindings --no-erase

# disable vi mode prompt
function fish_mode_prompt; end

# wasmtime
set -gx WASMTIME_HOME "~/.wasmtime"
#string match -r ".wasmtime" "$PATH" > /dev/null; or set -gx PATH "$WASMTIME_HOME/bin" $PATH
string match -r ".wasmtime" "$PATH" > /dev/null; or fish_add_path $WASMTIME_HOME/bin

