#!/bin/bash
#
# create symlinks for dotfiles

symlinks() {
  local dirs=(
    fish
    nvim
    tmux
    kitty
  )

  for dir in "${dirs[@]}"; do
    rm -rf "${HOME}/.config/${dir}"
    ln -sf "${HOME}/dotfiles/config/${dir}" "${HOME}/.config/${dir}"
  done
}

main() {
  symlinks
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  main "$@"
fi
