status is-interactive; and begin
  # Aliases
  alias astro 'env NVIM_APPNAME=astro nvim'
  alias chad 'env NVIM_APPNAME=nvchad nvim'
  alias gl 'git log --pretty=fuller'
  alias gs 'git stash'
  alias gsp 'git stash pop'
  alias la 'eza -aF -s ext --group-directories-first --icons'
  alias lazy 'env NVIM_APPNAME=lazy nvim'
  alias lg lazygit
  alias ll 'eza -laF -s ext --group-directories-first --icons'
  alias ls 'eza -F -s ext --group-directories-first --icons'
  alias lt 'eza -TF -s ext --group-directories-first --icons'
  alias vimdiff 'nvim -d'

  # Interactive shell initializations
  set -U fish_greeting
  fish_add_path $HOME/dotfiles/bin
  direnv hook fish | source
  zoxide init fish | source
  starship init fish | source
end
