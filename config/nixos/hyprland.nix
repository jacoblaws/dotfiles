{ pkgs, inputs, ... }:
let
  hyprland-pkgs = inputs.hyprland.packages.${pkgs.system};
in {
  programs.hyprland = {
    enable = true;

    package = hyprland-pkgs.default;
    portalPackage = hyprland-pkgs.xdg-desktop-portal-hyprland;
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
