#!/bin/bash
#
# creates a new tmux session for working with Aylur's GTK Widgets (AGS)

main() {
  local session='ags-config'
  local path="${HOME}/.config/ags"

  if ! tmux has-session -t "${selected_session}" >/dev/null 2>&1; then
    tmux new-session -d -s "${session}"  -c "${path}" -n 'nvim'
    tmux new-window  -d -t "${session}": -c "${path}" -n 'ags'
    tmux new-window  -d -t "${session}": -c "${path}" -n 'git'
    tmux select-window -t 1
  fi

  if [[ ! -z "${TMUX}" ]]; then
    tmux switch-client -t "${session}" >/dev/null 2>&1 || exit 1
  else
    tmux attach-session -t "${session}" >/dev/null 2>&1 || exit 1
  fi
}

main "$@"
