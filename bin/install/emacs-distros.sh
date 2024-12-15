#!/usr/bin/env bash
#
# install doom emacs and spacemacs into the correct directories

install_doomemacs() {
  if [[ ! -d "${HOME}/.local/share/doom-emacs" ]]; then
    git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.local/share/doom-emacs
    ~/.local/share/doom-emacs/bin/doom install
    ~/.local/share/doom-emacs/bin/doom sync
  else
    echo "Error: Doom Emacs directory already exists ('~/.local/share/doom-emacs')"
  fi
}

install_spacemacs() {
  if [[ ! -d "${HOME}/.local/share/spacemacs" ]]; then
    git clone https://github.com/syl20bnr/spacemacs ~/.local/share/spacemacs
  else
    echo "Error: Spacemacs directory already exists ('~/.local/share/spacemacs')"
  fi
}

main() {
  install_doomemacs
  install_spacemacs
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  main "$@"
fi
