{ pkgs, ... }: {
  programs.fish = {
    enable = true;
    generateCompletions = false;

    plugins = [
      { name = "z"; src = pkgs.fishPlugins.z.src; }
      { name = "fzf"; src = pkgs.fishPlugins.fzf.src; }
      { name = "sponge"; src = pkgs.fishPlugins.sponge.src; }
      { name = "puffer"; src = pkgs.fishPlugins.puffer.src; }
      { name = "autopair"; src = pkgs.fishPlugins.autopair.src; }
    ];

    interactiveShellInit = ''
      set -U fish_greeting
      fish_add_path $HOME/dotfiles/bin
      fish_add_path $HOME/.local/share/doom-emacs/bin
      starship init fish | source
    '';

    shellAliases = {
      tms = "tmux-sessions";
      ls = "eza -F   --icons --color=always --sort=ext --group-directories-first";
      la = "eza -aF  --icons --color=always --sort=ext --group-directories-first";
      ll = "eza -laF --icons --color=always --sort=ext --group-directories-first";
      lt = "eza -TF  --icons --color=always --sort=ext --group-directories-first";

      # git
      lg = "lazygit";
      gl = "git log --pretty=fuller";
      gs = "git stash";
      gsp = "git stash pop";

      # neovim distributions
      lazy = "NVIM_APPNAME=lazy nvim";
      chad = "NVIM_APPNAME=nvchad nvim";
      astro = "NVIM_APPNAME=astro nvim";

      # emacs distributions
      dm = "emacs --init-dir ~/.local/share/doom-emacs";
      sm = "emacs --init-dir ~/.local/share/spacemacs";
    };

    functions = {
      gsr = "git reset --soft HEAD~$argv[1]";
      gcad = "git rebase --committer-date-is-author-date HEAD~$argv[1]";
    };
  };
}
