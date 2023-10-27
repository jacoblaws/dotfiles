# general
set -U fish_greeting

# tide prompt
set -g tide_left_prompt_items pwd git jobs status newline character
set -g tide_right_prompt_items time os

# tide icons
set -g tide_git_icon ''
set -g tide_jobs_icon ''
set -g tide_os_icon ' '
set -g tide_status_icon_failure ''
set -g tide_character_icon ' ❯'
set -g tide_pwd_icon '  '
set -g tide_pwd_icon_home '  '
set -g tide_time_format ' %H:%M:%S'

# aliases
alias lg='lazygit'
alias tms='tmux-sessions'
alias ls='eza -F   --icons --color=always --sort=ext --group-directories-first'
alias la='eza -aF  --icons --color=always --sort=ext --group-directories-first'
alias ll='eza -laF --icons --color=always --sort=ext --group-directories-first'
alias lt='eza -TF  --icons --color=always --sort=ext --group-directories-first'

# path
fish_add_path $HOME/.local/bin
