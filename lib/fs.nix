lib: let b = builtins; in rec {
  dirModules = dir:
    b.readDir dir |>
    b.attrNames |>
    b.map (name: "${dir}/${name}");

  dirModulesRec = dir: lib.filesystem.listFilesRecursive dir;

  paths = f: dirs:
    b.map f dirs |>
    b.concatLists;

  modulePaths = dirs: paths dirModules dirs;

  modulePathsRec = dirs: paths dirModulesRec dirs;
}
