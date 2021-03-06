# Aliases
alias v="nvim"
alias c="code"
alias vimrc="nvim ~/.config/nvim/init.vim"
alias fishrc="nvim ~/.config/fish/config.fish"

## Git
alias g="git"
alias gpull="git pull"
alias gpush="git push"
alias ga="git add"
alias gd="git diff"
alias gs="git status"
alias gco="git commit"
alias gcm="git commit -m"
alias gc="git checkout"

## Common projects
alias platform="cd ~/projects/platform"
alias dotfiles="cd ~/projects/dotfiles"

## Elixir/Mix
alias mt="mix test"
alias mps="mix phx.server"
alias mcr="mix clean_run"
alias mtw="mix test.watch"

# Fish syntax highlighting
set -g fish_color_command green --bold
set -g fish_color_param white --bold
set -g fish_color_error brred --bold
set -g fish_color_autosuggestion grey
set -g fish_color_cwd green
set -g fish_color_cwd_root red
set -g lscolors_directory blue                        # directory
set -g lscolors_symlink magenta                       # symbolic link
set -g lscolors_socket green                          # socket
set -g lscolors_pipe brown                            # pipe
set -g lscolors_executable red                        # executable
set -g lscolors_block blue --background=cyan          # block special
set -g lscolors_character blue --background=brown     # character special
set -g lscolors_exec_suid black --background=red      # executable with setuid bit set
set -g lscolors_exec_sgid black --background=cyan     # executable with setgid bit set
set -g lscolors_dir_sticky black --background=green   # directory writable to others, with sticky bit
set -g lscolors_dir_unsticky black --background=brown # directory writable to others, without sticky bit

# Source asdf
source ~/.asdf/asdf.fish

# Setting starship prompt
starship init fish | source

# Environment variables
## Setting PATH for Python 3.10
## The original version is saved in /Users/chrisgilbert/.config/fish/config.fish.pysave
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.10/bin" "$PATH"

## Add Platform elm binary to $PATH
set PATH $HOME/projects/platform/assets/node_modules/.bin $PATH

## Keep iex history
set -x ERL_AFLAGS "-kernel shell_history enabled"
