{ ... }: {
  programs.tmux = {
    enable = true;

    mouse = true;    # enable mouse mode
    baseIndex = 1;   # start windows and panes at index 1
    escapeTime = 10; # remove neovim delay

    extraConfig = ''
      # pane management
      bind -n M-| split-window -h
      bind -n M-_ split-window -v
      bind -n M-q kill-pane
      bind -n M-= next-layout

      # pane navigation
      bind -n M-h select-pane -L
      bind -n M-j select-pane -D
      bind -n M-k select-pane -U
      bind -n M-l select-pane -R

      # pane resizing
      bind -n M-Left  resize-pane -L
      bind -n M-Down  resize-pane -D
      bind -n M-Up    resize-pane -U
      bind -n M-Right resize-pane -R

      # window management
      bind -n M-n new-window
      bind -n M-Q kill-window
      bind -n M-, command-prompt 'rename-window "%%"'
      bind -n M-S-Left  'swap-window -t -1 ; select-window -t -1'
      bind -n M-S-Right 'swap-window -t +1 ; select-window -t +1'

      # window navigation
      bind -n M-L next-window
      bind -n M-> next-window
      bind -n M-H previous-window
      bind -n M-< previous-window
      bind -n M-1 select-window -t 1
      bind -n M-2 select-window -t 2
      bind -n M-3 select-window -t 3
      bind -n M-4 select-window -t 4
      bind -n M-5 select-window -t 5
      bind -n M-6 select-window -t 6
      bind -n M-7 select-window -t 7
      bind -n M-8 select-window -t 8
      bind -n M-9 select-window -t 9
      bind -n M-0 select-window -t 0

      # status bar style
      set -g status-position top
      set -g status-left-length 100
      set -g status-style 'fg=white,bg=black'
      set -g status-left  '#[fg=green,bg=black]#[fg=green,bg=black]█#[fg=black,bg=green,bold] #{session_windows}#[fg=green,bg=black]█#[fg=green,bg=black]  '
      set -g status-right '#[fg=white,bg=black] #S  #[fg=green,bg=black]#[fg=green,bg=black]█#[fg=black,bg=green,bold]󱫋 #{session_attached}#[fg=green,bg=black]█#[fg=green,bg=black]'

      # window status style
      set -g window-status-separator '  '
      set -g window-status-style 'fg=white,bg=black'
      set -g window-status-format '#[fg=white,bg=black] #[fg=white,bg=black]#W'
      set -g window-status-current-format '#[fg=yellow,bg=black] #[fg=yellow,bg=black]#W'

      # window pane style
      set -g pane-border-lines 'heavy'
      set -g pane-border-style 'fg=black'
      set -g pane-active-border-style 'fg=black'

      # message style
      set -g message-style 'fg=yellow,bg=black'
      set -g message-command-style 'fg=yellow,bg=black'
    '';
  };
}
