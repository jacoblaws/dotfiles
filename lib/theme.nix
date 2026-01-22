lib:
let
  b = builtins;
  attrsets = lib.attrsets;
in {
  genFiles = dir: ext: spec: themes:
    let
      themeNames = b.attrNames themes;

      attrPaths = let
        modes = theme: [
          "${dir}/${theme}-dark${ext}"
          "${dir}/${theme}-light${ext}"
        ];
        names = b.concatMap modes themeNames;
      in b.map (theme: [ theme "text" ]) names;

      attrValues = let
        genSpec = name: b.map spec [ themes.${name}.dark themes.${name}.light ];
      in b.concatMap genSpec themeNames;

      toAttrSet = name: value: { inherit name value; };
      zipped = lib.zipListsWith toAttrSet attrPaths attrValues;
      attrsList = b.map (set: attrsets.setAttrByPath set.name set.value) zipped;
    in { home.file = attrsets.mergeAttrsList attrsList; };

  toCss = theme: # css
    ''
      :root {
        --red: #${theme.red};
        --yellow: #${theme.yellow};
        --green: #${theme.green};
        --blue: #${theme.blue};
        --magenta: #${theme.magenta};
        --cyan: #${theme.cyan};
        --orange: #${theme.orange};

        --grey0: #${theme.grey0};
        --grey1: #${theme.grey1};
        --grey2: #${theme.grey2};

        --fg: #${theme.fg};
        --bgd: #${theme.bgd};
        --bg0: #${theme.bg0};
        --bg1: #${theme.bg1};
        --bg2: #${theme.bg2};
        --bg3: #${theme.bg3};
        --bg4: #${theme.bg4};
        --bg5: #${theme.bg5};

        --bgr: #${theme.bgr};
        --bgy: #${theme.bgy};
        --bgg: #${theme.bgg};
        --bgb: #${theme.bgb};
        --bgm: #${theme.bgm};
        --bgv: #${theme.bgv};

        --sl1: #${theme.sl1};
        --sl2: #${theme.sl2};
        --sl3: #${theme.sl3};
      }
    '';

  toGtkCss = theme: # css
    ''
      @define-color red #${theme.red};
      @define-color yellow #${theme.yellow};
      @define-color green #${theme.green};
      @define-color blue #${theme.blue};
      @define-color magenta #${theme.magenta};
      @define-color cyan #${theme.cyan};
      @define-color orange #${theme.orange};

      @define-color grey0 #${theme.grey0};
      @define-color grey1 #${theme.grey1};
      @define-color grey2 #${theme.grey2};

      @define-color fg #${theme.fg};
      @define-color bgd #${theme.bgd};
      @define-color bg0 #${theme.bg0};
      @define-color bg1 #${theme.bg1};
      @define-color bg2 #${theme.bg2};
      @define-color bg3 #${theme.bg3};
      @define-color bg4 #${theme.bg4};
      @define-color bg5 #${theme.bg5};

      @define-color bgr #${theme.bgr};
      @define-color bgy #${theme.bgy};
      @define-color bgg #${theme.bgg};
      @define-color bgb #${theme.bgb};
      @define-color bgm #${theme.bgm};
      @define-color bgv #${theme.bgv};

      @define-color sl1 #${theme.sl1};
      @define-color sl2 #${theme.sl2};
      @define-color sl3 #${theme.sl3};
    '';
}
