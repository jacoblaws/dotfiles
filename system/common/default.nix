{ inputs, pkgs, ... }: {
  imports = [ ./themes ./substituters.nix ];

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
    commit-mono
    fira
    fira-go
    fira-code
    jetbrains-mono
    libertinus
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    nerd-fonts.symbols-only
    recursive
    roboto
    inter
  ];

  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      (final: prev: {
        zjstatus =
          inputs.zjstatus.packages.${prev.stdenv.hostPlatform.system}.default;
      })
    ];
  };

  time.timeZone = "America/Los_Angeles";
}
