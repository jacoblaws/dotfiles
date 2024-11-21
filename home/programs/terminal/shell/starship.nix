{ lib, ... }: {
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format = lib.concatStrings [
        "$directory$git_branch$git_status"
        "$c$lua$nodejs$python$rust"
        "$nix_shell$cmd_duration$status\n"
        "$character"
      ];

      directory = builtins.fromTOML ''
        read_only = ' 󰌾'
        truncation_length = 7
        format = '[$path]($style)[$read_only]($read_only_style) '
      '';

      git_branch = builtins.fromTOML ''
        symbol = '󰘬 '
        format = 'on [$symbol$branch(:$remote_branch)]($style) '
      '';

      git_status = builtins.fromTOML ''
        format = '([\[$all_status$ahead_behind\]]($style) )'
      '';

      nix_shell = builtins.fromTOML ''
        symbol = '󱄅 '
        format = '[$symbol$state]($style) '
      '';

      cmd_duration = builtins.fromTOML ''
        format = '[$duration]($style) '
      '';

      status = builtins.fromTOML ''
        format = '[$symbol$status]($style) '
      '';

      character = builtins.fromTOML ''
        format = '$symbol '
      '';

      c = builtins.fromTOML ''
        symbol = ' '
        format = '[$symbol($version(-$name) )]($style)'
      '';

      lua = builtins.fromTOML ''
        symbol = '󰢱 '
        format = '[$symbol($version )]($style)'
      '';

      nodejs = builtins.fromTOML ''
        symbol = '󰎙 '
        format = '[$symbol($version )]($style)'
      '';

      python = builtins.fromTOML ''
        symbol = '󰌠 '
        format = '[$symbol$pyenv_prefix($version )(\($virtualenv\) )]($style)'
      '';

      rust = builtins.fromTOML ''
        symbol = '󱘗 '
        format = '[$symbol($version )]($style)'
      '';
    };
  };
}
