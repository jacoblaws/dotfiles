lib: {
  extended = {
    fs = import ./fs.nix lib;
    theme = import ./theme.nix lib;
  };
}
