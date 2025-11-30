{ osConfig, lib, ... }:
let
  genTheme = pal: ''
    background = #${pal.bg0}
    foreground = #${pal.fg}
    cursor-color = #${pal.fg}
    cursor-text = #${pal.bg0}
    selection-background = #${pal.bgv}
    selection-foreground = #${pal.bg0}
    palette = 0=#${pal.bgd}
    palette = 1=#${pal.red}
    palette = 2=#${pal.green}
    palette = 3=#${pal.yellow}
    palette = 4=#${pal.blue}
    palette = 5=#${pal.magenta}
    palette = 6=#${pal.cyan}
    palette = 7=#${pal.fg}
    palette = 8=#${pal.bg0}
    palette = 9=#${pal.red}
    palette = 10=#${pal.green}
    palette = 11=#${pal.yellow}
    palette = 12=#${pal.blue}
    palette = 13=#${pal.magenta}
    palette = 14=#${pal.cyan}
    palette = 15=#${pal.fg}
  '';

  b = builtins;
  inherit (osConfig) themes;
  themeNames = b.attrNames themes;

  attrPaths = let
    dir = ".config/ghostty/themes";
    paths = theme: [ theme "text" ];
    modes = theme: [ "${dir}/${theme}-dark" "${dir}/${theme}-light" ];
    names = b.concatMap modes themeNames;
  in b.map paths names;

  attrValues = let
    genSpec = name: b.map genTheme [ themes.${name}.dark themes.${name}.light ];
  in b.concatMap genSpec themeNames;

  genThemes = let
    zipTransform = name: value: { inherit name value; };
    zipped = lib.zipListsWith zipTransform attrPaths attrValues;
    list = b.map (set: lib.attrsets.setAttrByPath set.name set.value) zipped;
  in { home.file = lib.attrsets.mergeAttrsList list; };
in genThemes
