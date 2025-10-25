{
  imports = [ ./games.nix ];

  programs = {
    fish.enable = true;
    niri.enable = true;
    hyprland.enable = true;
    xwayland.enable = true;

    appimage = {
      enable = true;
      binfmt = true;
    };

    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep 5 --keep-since 1w --nogcroots";
      flake = "/home/jvl/dotfiles";
    };
  };

  xdg.portal.wlr.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
