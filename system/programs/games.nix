{ pkgs, ... }: {
  programs.steam = {
    enable = true;
    protontricks.enable = true;
    gamescopeSession.enable = true;

    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  programs.gamescope = {
    enable = true;
    capSysNice = false;
    args = [
      "--rt"
      "--expose-wayland"
    ];
  };

  programs.gamemode = {
    enable = true;
    enableRenice = false;
  };

  services.ananicy = {
    enable = true;
    package = pkgs.ananicy-cpp;
    rulesProvider = pkgs.ananicy-cpp;
    extraRules = [
      {
        "name" = "gamescope";
        "nice" = -20;
      }
    ];
  };
}
