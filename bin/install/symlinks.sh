#!/bin/bash
#
# create symlinks for dotfiles

bin_symlinks() {
  local scripts=(
    tmux-sessions
  )

  for script in "${scripts[@]}"; do
    rm -rf "${HOME}/.local/bin/${script}"
    ln -sf "${HOME}/dotfiles/bin/${script}" "${HOME}/.local/bin/${script}"
  done
}

config_symlinks() {
  local dirs=(
    fish
    nvim
    tmux
    kitty
    ags
  )

  for dir in "${dirs[@]}"; do
    rm -rf "${HOME}/.config/${dir}"
    ln -sf "${HOME}/dotfiles/config/${dir}" "${HOME}/.config/${dir}"
  done
}

main() {
  bin_symlinks
  config_symlinks
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  main "$@"
fi
