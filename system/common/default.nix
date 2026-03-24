{ inputs, pkgs, ... }:
{
  imports = [
    ./themes
    ./substituters.nix
  ];

  nix = {
    optimise.automatic = true;
    settings.experimental-features = "flakes nix-command pipe-operators";
  };

  programs = {
    bash.enable = true;
    zsh.enable = true;
  };

  environment.systemPackages = [ pkgs.git ];
  fonts.packages = with pkgs; [
    alegreya
    alegreya-sans
    cardo
    commit-mono
    fira
    fira-code
    fira-go
    garamond-libre
    inter
    jetbrains-mono
    junicode
    libertinus
    nerd-fonts.symbols-only
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    recursive
    roboto

    # Select specific fonts from google fonts
    (pkgs.google-fonts.override {
      fonts = [
        "Almendra"
        "Amarante"
        "EB Garamond"
        "Fondamento"
        "Grenze Gotisch"
        "Grenze"
        "IM Fell English"
      ];
    })
  ];

  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      (final: prev: {
        zjstatus = inputs.zjstatus.packages.${prev.stdenv.hostPlatform.system}.default;
      })
    ];
  };

  time.timeZone = "America/Los_Angeles";
}
