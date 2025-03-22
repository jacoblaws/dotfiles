{ self, ... }: {
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep 5 --keep-since 1w";
    flake = "${self}";
  };
}
