if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -U fish_greeting

# -----------------------------------------------------------------------------
# GENERAL PATHS
# -----------------------------------------------------------------------------
fish_add_path $HOME/.local/bin

# -----------------------------------------------------------------------------
# General Settings
# -----------------------------------------------------------------------------
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx EDITOR nvim
set -gx MYVIMRC $XDG_CONFIG_HOME/nvim/init.lua
set -gx TEALDEER_CONFIG_DIR $XDG_CONFIG_HOME/tealdeer
set -gx VISUAL nvim

# source functions
if test -f $XDG_CONFIG_HOME/fish/exports.fish
    source $XDG_CONFIG_HOME/fish/exports.fish
end
set -gx DOTNET_CLI_TELEMETRY_OPTOUT 1

# NVM
set --universal nvm_default_version v24.11.1

# Homebrew
fish_add_path /opt/homebrew/bin/

/opt/homebrew/bin/brew shellenv | source

# Rust
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.cargo/env.fish
fish_add_path $HOME/.local/share/solana/install/active_release/bin

# Go
set -Ux GOPATH $HOME/go

fish_add_path /usr/local/go/bin
fish_add_path $GOPATH/bin

# Ruby
fish_add_path /opt/homebrew/opt/ruby/bin

set LDFLAGS -L/opt/homebrew/opt/ruby/lib
set CPPFLAGS -I/opt/homebrew/opt/ruby/include

# Android SDK
set JAVA_HOME /Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
set -Ux ANDROID_HOME $HOME/Library/Android/sdk

fish_add_path $ANDROID_HOME/cmdline-tools
fish_add_path $ANDROID_HOME/build-tools
fish_add_path $ANDROID_HOME/platform-tools

# source aliases
if test -f $XDG_CONFIG_HOME/fish/aliases.fish
    source $XDG_CONFIG_HOME/fish/aliases.fish
end

# source functions
if test -f $XDG_CONFIG_HOME/fish/functions.fish
    source $XDG_CONFIG_HOME/fish/functions.fish
end


# Dotnet
fish_add_path $HOME/.dotnet/tools

fish_add_path /opt/homebrew/opt/gnu-tar/libexec/gnubin
fish_add_path /opt/homebrew/opt/solana/bin/

# Zoxide (cd)
zoxide init fish --cmd cd | source

# FZF 
fzf --fish | source


# Starfish
starship init fish | source


string match -q "$TERM_PROGRAM" "kiro" and . (kiro --locate-shell-integration-path fish)
