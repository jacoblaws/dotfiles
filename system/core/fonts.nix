{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      jetbrains-mono
      nerd-fonts.symbols-only
    ];

    enableDefaultPackages = false;

    fontconfig.defaultFonts = {
      serif = [ "Noto Serif" ];
      sansSerif = [ "Noto Sans" ];
      monospace = [ "JetBrainsMono" "SymbolsNerdFontMono" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
