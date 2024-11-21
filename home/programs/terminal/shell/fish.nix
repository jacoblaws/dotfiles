{ pkgs, ... }: {
  programs.fish = {
    enable = true;

    plugins = [
      { name = "z"; src = pkgs.fishPlugins.z.src; }
      { name = "fzf"; src = pkgs.fishPlugins.fzf.src; }
      { name = "sponge"; src = pkgs.fishPlugins.sponge.src; }
      { name = "puffer"; src = pkgs.fishPlugins.puffer.src; }
      { name = "autopair"; src = pkgs.fishPlugins.autopair.src; }
    ];

    shellInit = ''
      set -U fish_greeting
      fish_add_path $HOME/dotfiles/bin
      starship init fish | source
    '';

    shellAliases = {
      lg = "lazygit";
      tms = "tmux-sessions";
      ls = "eza -F   --icons --color=always --sort=ext --group-directories-first";
      la = "eza -aF  --icons --color=always --sort=ext --group-directories-first";
      ll = "eza -laF --icons --color=always --sort=ext --group-directories-first";
      lt = "eza -TF  --icons --color=always --sort=ext --group-directories-first";
    };
  };
}