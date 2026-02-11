{ pkgs, ... }: {

  home.shellAliases = {
    # eza
    ls = "eza -F -s ext --group-directories-first --icons";
    la = "eza -aF -s ext --group-directories-first --icons";
    ll = "eza -laF -s ext --group-directories-first --icons";
    lt = "eza -TF -s ext --group-directories-first --icons";

    # git
    lg = "lazygit";
    gl = "git log --pretty=fuller";
    gs = "git stash";
    gsp = "git stash pop";

    # neovim distributions
    lazy = "env NVIM_APPNAME=lazy nvim";
    chad = "env NVIM_APPNAME=nvchad nvim";
    astro = "env NVIM_APPNAME=astro nvim";
  };

  programs.bash = {
    enable = true;

    # source: https://wiki.nixos.org/wiki/Fish#Setting_fish_as_default_shell
    initExtra = # bash
      ''
        if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
        then
          shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
          exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
        fi
      '';
  };

  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set -U fish_greeting
      fish_add_path $HOME/dotfiles/bin
    '';

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

      def gsr [ num: int ] { git reset --soft HEAD~($num) }
      def gcad [ num: int ] { git rebase --committer-date-is-author-date HEAD~($num) }
    '';
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.zoxide.enable = true;
  programs.man.generateCaches = false;
}
