{ pkgs, ... }: {
  # packages for android studio
  home.packages = with pkgs; [
    android-studio
    android-studio-tools
    android-tools
    android-udev-rules
    gradle
    jdk
  ];
}
