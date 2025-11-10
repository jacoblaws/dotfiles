{ pkgs, ... }: {
  imports = [ ./ideavimrc.nix ];

  # packages for android studio
  home.packages = with pkgs; [
    android-studio
    android-studio-tools
    android-tools
    gradle
    jdk
  ];
}
