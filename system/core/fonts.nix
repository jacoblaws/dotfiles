{ pkgs, ... }: {
  fonts = {
    packages = with pkgs; [
      alegreya
      alegreya-sans
      commit-mono
      fira
      fira-go
      fira-code
      jetbrains-mono
      libertinus
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      nerd-fonts.symbols-only
      recursive
      roboto
      inter
    ];

    fontDir.enable = true;
    enableDefaultPackages = false;
    enableGhostscriptFonts = false;

    fontconfig = {
      enable = true;
      antialias = true;

      subpixel = {
        rgba = "rgb";
        lcdfilter = "default";
      };

      hinting = {
        enable = true;
        autohint = false;
        style = "slight";
      };

      defaultFonts = {
        serif = [ "Libertinus Serif" ];
        sansSerif = [ "Recursive Sans Casual Static" ];
        monospace = [ "Rec Mono Casual" "Symbols Nerd Font" ];
        emoji = [ "Noto Color Emoji" ];
      };

      localConf = ''
        <match target="font">
          <test name="family" compare="eq" ignore-blanks="true">
            <string>Recursive</string>
          </test>
          <edit name="fontfeatures" mode="append">
            <string>dlig on</string> <!-- code ligatures -->
            <string>ss01 on</string> <!-- no-serif 'L' and 'Z' -->
            <string>ss02 on</string> <!-- no-serif 'L' and 'Z' -->
            <string>ss03 on</string> <!-- no-serif 'L' and 'Z' -->
            <string>ss04 on</string> <!-- no-serif 'L' and 'Z' -->
            <string>ss05 on</string> <!-- no-serif 'L' and 'Z' -->
            <string>ss06 on</string> <!-- no-serif 'L' and 'Z' -->
            <string>ss07 on</string> <!-- no-serif 'L' and 'Z' -->
            <string>ss08 on</string> <!-- no-serif 'L' and 'Z' -->
            <string>ss12 on</string> <!-- simplified mono 'at' -->
          </edit>
        </match>
      '';
    };
  };
}
