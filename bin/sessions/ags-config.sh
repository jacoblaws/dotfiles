#!/usr/bin/env bash
#
# creates a new tmux session for working with Aylur's GTK Widgets (AGS)

main() {
  local session='ags-config'
  local path="${HOME}/dotfiles/config/ags"

  if ! tmux has-session -t "${selected_session}" >/dev/null 2>&1; then
    tmux new-session -d -s "${session}"  -c "${path}" -n 'nvim'
    tmux new-window  -d -t "${session}": -c "${path}" -n 'ags'
    tmux new-window  -d -t "${session}": -c "${path}" -n 'git'
    tmux select-window -t 1

    tmux send-keys -t "${session}":1 nvim    Enter
    tmux send-keys -t "${session}":2 ags     Enter
    tmux send-keys -t "${session}":3 lazygit Enter
  fi

  if [[ ! -z "${TMUX}" ]]; then
    tmux switch-client -t "${session}" >/dev/null 2>&1 || exit 1
  else
    tmux attach-session -t "${session}" >/dev/null 2>&1 || exit 1
  fi
}

main "$@"
