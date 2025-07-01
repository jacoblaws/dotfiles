{
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

      alias dm = emacs --init-dir ~/.local/share/doom-emacs
      alias sm = emacs --init-dir ~/.local/share/spacemacs

      def ls [] { eza -F   --icons --color=always --sort=ext --group-directories-first }
      def la [] { eza -aF  --icons --color=always --sort=ext --group-directories-first }
      def ll [] { eza -laF --icons --color=always --sort=ext --group-directories-first }
      def lt [] { eza -TF  --icons --color=always --sort=ext --group-directories-first }

      def gsr [ num: int ] { git reset --soft HEAD~($num) }
      def gcad [ num: int ] { git rebase --committer-date-is-author-date HEAD~($num) }
    '';
  };
}
