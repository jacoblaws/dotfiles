# general
set -U fish_greeting

# aliases
alias lg='lazygit'
alias tms='tmux-sessions'
alias ls='eza -F   --icons --color=always --sort=ext --group-directories-first'
alias la='eza -aF  --icons --color=always --sort=ext --group-directories-first'
alias ll='eza -laF --icons --color=always --sort=ext --group-directories-first'
alias lt='eza -TF  --icons --color=always --sort=ext --group-directories-first'

# path
fish_add_path $HOME/dotfiles/bin
