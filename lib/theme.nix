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
}
