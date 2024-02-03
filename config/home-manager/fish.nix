{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    plugins =  [
      { name = "z"; src = pkgs.fishPlugins.z.src; }
      { name = "fzf"; src = pkgs.fishPlugins.fzf.src; }
      { name = "sponge"; src = pkgs.fishPlugins.sponge.src; }
      { name = "puffer"; src = pkgs.fishPlugins.puffer.src; }
      { name = "autopair"; src = pkgs.fishPlugins.autopair.src; }
    ];
  };

  xdg.configFile.fish = {
    source = ../fish;
    recursive = true;
  };
}
