{ pkgs, ... }: {
  home.packages = with pkgs; [ tauon ];
  home.file = {
      ".local/share/TauonMusicBox/theme/".source = ./.;
  };
}
