{ pkgs, ... }: {
  imports = [
    ./cursor.nix
    ./gtk.nix
  ];

  home.packages = with pkgs; [
    gnome-themes-extra
    gtk-engine-murrine
  ];
}
