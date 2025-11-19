{ pkgs, ... }: {
  programs.bash = {
    enable = true;
    initExtra = ''
      exec nu
    '';
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

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
    };

    functions = {
      gsr = "git reset --soft HEAD~$argv[1]";
      gcad = "git rebase --committer-date-is-author-date HEAD~$argv[1]";
    };
  };

  programs.nushell = {
    enable = true;
    settings = {
      buffer_editor = "nvim";
      show_banner = false;
    };
    configFile.text = ''
      alias fg = job unfreeze
      alias core-ls = ls

      alias gl = git log --pretty=fuller
      alias gs = git stash
      alias gsp = git stash pop
      alias lg = lazygit

      alias lazy = NVIM_APPNAME=lazy nvim
      alias chad = NVIM_APPNAME=nvchad nvim
      alias astro = NVIM_APPNAME=astro nvim

      def ls [] { eza -F   --icons --color=always --sort=ext --group-directories-first }
      def la [] { eza -aF  --icons --color=always --sort=ext --group-directories-first }
      def ll [] { eza -laF --icons --color=always --sort=ext --group-directories-first }
      def lt [] { eza -TF  --icons --color=always --sort=ext --group-directories-first }

      def gsr [ num: int ] { git reset --soft HEAD~($num) }
      def gcad [ num: int ] { git rebase --committer-date-is-author-date HEAD~($num) }
    '';
  };

  programs.zoxide.enable = true;
}
