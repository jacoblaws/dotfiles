{
  fonts = {
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
        style = "full";
      };

      defaultFonts = {
        serif = [ "Libertinus Serif" ];
        sansSerif = [ "Recursive Sans Casual Static" ];
        monospace = [ "Recursive Mono Casual Static" "Symbols Nerd Font" ];
        emoji = [ "Noto Color Emoji" ];
      };

      localConf = ''
        <match target="font">
          <test name="family" compare="eq" ignore-blanks="true">
            <string>Recursive</string>
          </test>
          <edit name="fontfeatures" mode="append">
            <string>dlig on</string>  <!-- code ligatures -->
            <string>ss01 on</string>  <!-- single-story 'a' -->
            <string>ss02 on</string>  <!-- single-story 'g' -->
            <string>ss03 off</string> <!-- simplified 'f' -->
            <string>ss04 on</string>  <!-- simplified 'i' -->
            <string>ss05 on</string>  <!-- simplified 'l' -->
            <string>ss06 on</string>  <!-- simplified 'r' -->
            <string>ss07 on</string>  <!-- simplified italid diagonals -->
            <string>ss08 on</string>  <!-- no-serif 'L' & 'Z' -->
            <string>ss12 on</string>  <!-- simplified mono '@' -->
          </edit>
        </match>
      '';
    };
  };
}
