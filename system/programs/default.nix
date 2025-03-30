{ inputs, pkgs, ... }: {
  programs.fish.enable = true;
  programs.command-not-found.dbPath =
    inputs.programsdb.packages.${pkgs.system}.programs-sqlite;
  documentation.man.generateCaches = false;

  programs.appimage = {
    enable = true;
    binfmt = true;
  };
}
